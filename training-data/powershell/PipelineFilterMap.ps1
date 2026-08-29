$numbers = 1..20
$result = $numbers | Where-Object { $_ % 2 -eq 0 } | ForEach-Object { $_ * $_ } | Measure-Object -Sum
$result.Sum
