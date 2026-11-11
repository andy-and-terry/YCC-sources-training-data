# Square of the sum minus sum of squares for 1..10 (expect 2640)
$xs = 1..10
$sum = ($xs | Measure-Object -Sum).Sum
$squares = ($xs | ForEach-Object { $_ * $_ } | Measure-Object -Sum).Sum
$sum * $sum - $squares
