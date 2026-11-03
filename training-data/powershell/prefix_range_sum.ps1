$values = 3, 1, 4, 1, 5, 9, 2, 6
$prefix = @(0)
foreach ($v in $values) { $prefix += $prefix[-1] + $v }

function Get-RangeSum($lo, $hi) { $prefix[$hi] - $prefix[$lo] }

Get-RangeSum 2 5
