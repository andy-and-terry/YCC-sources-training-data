$add = { param($a, $b) $a + $b }
& $add 2 3
$multiplier = 3
$times = { param($x) $x * $multiplier }.GetNewClosure()
$multiplier = 100
& $times 5
1..3 | ForEach-Object -Begin { $t = 0 } -Process { $t += $_ } -End { $t }
