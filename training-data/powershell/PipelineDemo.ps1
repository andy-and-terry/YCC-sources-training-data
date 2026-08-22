$numbers = 1..10

$evenSquares = $numbers |
    Where-Object { $_ % 2 -eq 0 } |
    ForEach-Object { $_ * $_ }

$evenSquares

$sum = ($numbers | Measure-Object -Sum).Sum
Write-Output "Sum: $sum"
