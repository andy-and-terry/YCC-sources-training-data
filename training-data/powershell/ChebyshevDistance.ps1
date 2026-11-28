function Get-Chebyshev {
    param([int[]]$A, [int[]]$B)
    $max = 0
    for ($i = 0; $i -lt $A.Length; $i++) { $max = [math]::Max($max, [math]::Abs($A[$i] - $B[$i])) }
    $max
}

Get-Chebyshev -A 1, 2 -B 4, 6
