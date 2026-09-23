class Command {
    [scriptblock]$ExecuteAction
    [scriptblock]$UndoAction
    Command([scriptblock]$execute, [scriptblock]$undo) {
        $this.ExecuteAction = $execute
        $this.UndoAction = $undo
    }
    [void] Execute() { & $this.ExecuteAction }
    [void] Undo() { & $this.UndoAction }
}

$script:Total = 0

function New-AddCommand([int]$Amount) {
    $execute = { $script:Total += $Amount }.GetNewClosure()
    $undo = { $script:Total -= $Amount }.GetNewClosure()
    return [Command]::new($execute, $undo)
}

$history = New-Object System.Collections.Generic.List[Command]

function Invoke-TrackedCommand([Command]$Cmd) {
    $Cmd.Execute()
    $history.Add($Cmd)
}

function Undo-LastCommand {
    if ($history.Count -gt 0) {
        $cmd = $history[$history.Count - 1]
        $history.RemoveAt($history.Count - 1)
        $cmd.Undo()
    }
}

Invoke-TrackedCommand (New-AddCommand 5)
Invoke-TrackedCommand (New-AddCommand 10)
$Total
Undo-LastCommand
$Total
