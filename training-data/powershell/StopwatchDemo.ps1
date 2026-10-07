$sw = [System.Diagnostics.Stopwatch]::StartNew()
Start-Sleep -Milliseconds 120
$sw.Stop()
"Elapsed >= 100ms: $($sw.ElapsedMilliseconds -ge 100)"

$sw.Restart()
$null = 1..50000 | ForEach-Object { $_ * 2 }
"Pipeline finished, running: $($sw.IsRunning)"

$t = Measure-Command { 1..1000 | Where-Object { $_ % 7 -eq 0 } }
"Measure-Command type: $($t.GetType().Name)"
"Took under 5s: $($t.TotalSeconds -lt 5)"
