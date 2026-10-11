function Set-LogLevel {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Debug', 'Info', 'Warn', 'Error')]
        [string]$Level,

        [ValidateRange(1, 10)]
        [int]$Retries = 3,

        [ValidatePattern('^[a-z]+\.log$')]
        [string]$File = 'app.log'
    )
    "Level=$Level Retries=$Retries File=$File"
}

Set-LogLevel -Level Info
Set-LogLevel -Level Warn -Retries 5 -File 'audit.log'
try { Set-LogLevel -Level Verbose } catch { "Rejected: $($_.Exception.Message)" }
try { Set-LogLevel -Level Info -Retries 50 } catch { "Rejected: retries out of range" }
