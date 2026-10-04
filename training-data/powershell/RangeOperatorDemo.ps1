1..5 -join ','
5..1 -join ','
$arr = 10, 20, 30, 40, 50
$arr[1..3] -join ','
$arr[-1]
$arr[-2..-1] -join ','
'a'..'e' -join ''
$arr[0..($arr.Length - 2)] -join ','
(1..10 | Where-Object { $_ % 3 -eq 0 }) -join ','
