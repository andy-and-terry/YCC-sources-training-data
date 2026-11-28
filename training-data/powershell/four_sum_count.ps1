function Get-FourSumCount {
    param([int[]]$A, [int[]]$B, [int[]]$C, [int[]]$D)
    $sums = @{}
    foreach ($x in $A) { foreach ($y in $B) { $sums[$x + $y] = 1 + [int]$sums[$x + $y] } }
    $count = 0
    foreach ($x in $C) { foreach ($y in $D) { $count += [int]$sums[-($x + $y)] } }
    $count
}

Get-FourSumCount @(1, 2) @(-2, -1) @(-1, 2) @(0, 2)   # 2
