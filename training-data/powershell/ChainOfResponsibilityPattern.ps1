class SupportHandler {
    [SupportHandler]$Next

    [SupportHandler] SetNext([SupportHandler]$handler) {
        $this.Next = $handler
        return $handler
    }

    # PowerShell classes have no `base.Method()` call syntax outside
    # constructors, so an overridden Handle() cannot call its parent's
    # version directly. Forward() stays undefined in every subclass, so
    # it always resolves here instead of recursing into an override.
    [void] Forward([int]$severity, [string]$message) {
        if ($null -ne $this.Next) {
            $this.Next.Handle($severity, $message)
        } else {
            Write-Output "unhandled: $message"
        }
    }

    [void] Handle([int]$severity, [string]$message) {
        $this.Forward($severity, $message)
    }
}

class Level1Support : SupportHandler {
    [void] Handle([int]$severity, [string]$message) {
        if ($severity -le 1) {
            Write-Output "Level1: $message"
        } else {
            $this.Forward($severity, $message)
        }
    }
}

class Level2Support : SupportHandler {
    [void] Handle([int]$severity, [string]$message) {
        if ($severity -le 3) {
            Write-Output "Level2: $message"
        } else {
            $this.Forward($severity, $message)
        }
    }
}

class Level3Support : SupportHandler {
    [void] Handle([int]$severity, [string]$message) {
        Write-Output "Level3: $message"
    }
}

$level1 = [Level1Support]::new()
$level2 = [Level2Support]::new()
$level3 = [Level3Support]::new()
$level1.SetNext($level2).SetNext($level3) | Out-Null

$level1.Handle(1, 'password reset')
$level1.Handle(2, 'server slow')
$level1.Handle(5, 'data center outage')
