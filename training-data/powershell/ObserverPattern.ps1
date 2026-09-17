class Subject {
    [System.Collections.Generic.List[scriptblock]]$Observers = [System.Collections.Generic.List[scriptblock]]::new()

    [void] Subscribe([scriptblock]$observer) {
        $this.Observers.Add($observer)
    }

    [void] Notify([string]$eventName) {
        foreach ($observer in $this.Observers) {
            & $observer $eventName
        }
    }
}

$subject = [Subject]::new()
$subject.Subscribe({ param($e) Write-Output "logger saw: $e" })
$subject.Subscribe({ param($e) Write-Output "mailer sending alert for: $e" })

$subject.Notify('order-placed')
