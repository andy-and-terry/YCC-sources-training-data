$jobs = 1..3 | ForEach-Object { Start-Job -ScriptBlock { param($n) $n * 10 } -ArgumentList $_ }
$jobs | Wait-Job | Receive-Job
