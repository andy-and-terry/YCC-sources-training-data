class Subject {
    [System.Collections.ArrayList]$Observers

    Subject() {
        $this.Observers = New-Object System.Collections.ArrayList
    }

    [void] Attach($observer) {
        [void]$this.Observers.Add($observer)
    }

    [void] Notify([string]$eventName) {
        foreach ($observer in $this.Observers) {
            $observer.Update($eventName)
        }
    }
}

class EmailNotifier {
    [void] Update([string]$eventName) {
        "Email: received event '$eventName'"
    }
}

class LogNotifier {
    [void] Update([string]$eventName) {
        "Log: recorded event '$eventName'"
    }
}

$subject = [Subject]::new()
$subject.Attach([EmailNotifier]::new())
$subject.Attach([LogNotifier]::new())

$subject.Notify("OrderPlaced")
$subject.Notify("OrderShipped")
