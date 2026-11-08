$xs = 10, 12, 15, 15, 20
$d = @($xs[0]) + (1..($xs.Count - 1) | ForEach-Object { $xs[$_] - $xs[$_ - 1] })
"Encoded: $d"
$acc = 0
$back = $d | ForEach-Object { $acc += $_; $acc }
"Decoded: $back"
