class Subject {
    [System.Collections.ArrayList]$Observers

    Subject() {
        $this.Observers = New-Object System.Collections.ArrayList
    }

    [void] Attach($observer) {
        [void]$this.Observers.Add($observer)
    }

    [void] Notify([string]$event) {
        foreach ($observer in $this.Observers) {
            $observer.Update($event)
        }
    }
}

class EmailNotifier {
    [void] Update([string]$event) {
        "Email: received event '$event'"
    }
}

class LogNotifier {
    [void] Update([string]$event) {
        "Log: recorded event '$event'"
    }
}

$subject = [Subject]::new()
$subject.Attach([EmailNotifier]::new())
$subject.Attach([LogNotifier]::new())

$subject.Notify("OrderPlaced")
$subject.Notify("OrderShipped")
