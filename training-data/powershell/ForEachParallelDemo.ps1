# ForEach-Object -Parallel (PowerShell 7+) runs the script block on several threads.
$results = 1..8 | ForEach-Object -Parallel {
    Start-Sleep -Milliseconds (100 * (9 - $_))
    [pscustomobject]@{ Input = $_; Square = $_ * $_ }
} -ThrottleLimit 4

# Output order follows completion, so sort for stable results.
$results | Sort-Object Input | Format-Table -AutoSize

# Variables from the caller are reached through the $using: scope.
$offset = 100
$shifted = 1..3 | ForEach-Object -Parallel { $_ + $using:offset }
"shifted: $($shifted | Sort-Object)"
