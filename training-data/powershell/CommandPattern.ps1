class Light {
    [bool]$IsOn = $false
    TurnOn() { $this.IsOn = $true }
    TurnOff() { $this.IsOn = $false }
}

class TurnOnCommand {
    [Light]$Light
    TurnOnCommand([Light]$light) { $this.Light = $light }
    Execute() { $this.Light.TurnOn() }
    Undo() { $this.Light.TurnOff() }
}

class TurnOffCommand {
    [Light]$Light
    TurnOffCommand([Light]$light) { $this.Light = $light }
    Execute() { $this.Light.TurnOff() }
    Undo() { $this.Light.TurnOn() }
}

class RemoteControl {
    [System.Collections.Generic.Stack[object]]$History = [System.Collections.Generic.Stack[object]]::new()
    PressButton([object]$command) {
        $command.Execute()
        $this.History.Push($command)
    }
    PressUndo() {
        if ($this.History.Count -gt 0) { $this.History.Pop().Undo() }
    }
}

$light = [Light]::new()
$remote = [RemoteControl]::new()
$remote.PressButton([TurnOnCommand]::new($light))
$light.IsOn
$remote.PressUndo()
$light.IsOn
