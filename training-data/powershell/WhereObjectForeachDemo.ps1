$numbers = 1..10

$evens = $numbers | Where-Object { $_ % 2 -eq 0 }
"evens: $($evens -join ', ')"

$squares = $numbers | ForEach-Object { $_ * $_ }
"squares: $($squares -join ' ')"

$big = $numbers.Where({ $_ -gt 7 })
"big: $big"

$total = ($numbers | Measure-Object -Sum -Average -Maximum)
"sum=$($total.Sum) avg=$($total.Average) max=$($total.Maximum)"

$first3 = $numbers | Select-Object -First 3
"first3: $first3"
$numbers | Where-Object { $_ -gt 8 } | ForEach-Object { "large number: $_" }
