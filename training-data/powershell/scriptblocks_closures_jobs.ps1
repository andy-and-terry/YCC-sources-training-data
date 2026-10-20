$add = { param($a, $b) $a + $b }
& $add 2 3
$add.Invoke(4, 5)
function New-Counter { $n = 0; { $script:n++; $n }.GetNewClosure() }
$c = New-Counter
& $c; & $c
$mul = [scriptblock]::Create('param($x) $x * 3')
& $mul 7
1..3 | ForEach-Object -Begin { $sum = 0 } -Process { $sum += $_ } -End { $sum }
$job = Start-Job -ScriptBlock { 6 * 7 }
Wait-Job $job | Out-Null
Receive-Job $job
Remove-Job $job
$jobs = 1..3 | ForEach-Object { Start-ThreadJob -ScriptBlock { param($n) $n * $n } -ArgumentList $_ -ErrorAction SilentlyContinue }
if ($jobs) { ($jobs | Wait-Job | Receive-Job | Sort-Object) -join ',' }
$ps = [powershell]::Create().AddScript('Get-Date').AddScript('1+1')
$ps.Invoke() | Select-Object -Last 1
&{ param($x) "ran with $x" } 'inline'
