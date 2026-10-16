$a = 10, 20, 30, 40, 50, 60

$a[0]
$a[-1]
$a[1..3] -join ','
$a[-3..-1] -join ','
$a[0, 2, 4] -join ','
$a[($a.Length - 1)..0] -join ','
($a | Select-Object -First 2) -join ','
($a | Select-Object -Skip 4) -join ','
$a[10] -eq $null

$matrix = @(@(1, 2), @(3, 4))
$matrix[1][0]
