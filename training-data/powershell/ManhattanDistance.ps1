function Get-Manhattan {
    param([int[]]$A, [int[]]$B)
    $sum = 0
    for ($i = 0; $i -lt $A.Length; $i++) { $sum += [math]::Abs($A[$i] - $B[$i]) }
    $sum
}

Get-Manhattan -A 1, 2 -B 4, 6
