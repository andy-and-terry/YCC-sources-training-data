$sum = 0
$tri = 1..10 | ForEach-Object { $sum += $_; $sum }
$tri -join " "
