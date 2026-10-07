class LegacyLogger {
    [void] WriteEntry([string]$text) {
        "LEGACY: $text"
    }
}

class ModernLogger {
    [void] Log([string]$message) {
        "MODERN: $message"
    }
}

class LegacyLoggerAdapter {
    [LegacyLogger]$Legacy

    LegacyLoggerAdapter([LegacyLogger]$legacy) {
        $this.Legacy = $legacy
    }

    [void] Log([string]$message) {
        $this.Legacy.WriteEntry($message)
    }
}

$loggers = @(
    [ModernLogger]::new()
    [LegacyLoggerAdapter]::new([LegacyLogger]::new())
)

foreach ($logger in $loggers) {
    $logger.Log("service started")
}
