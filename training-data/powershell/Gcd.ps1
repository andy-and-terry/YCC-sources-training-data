function Get-Gcd {
    param([int]$A, [int]$B)
    while ($B -ne 0) {
        $temp = $B
        $B = $A % $B
        $A = $temp
    }
    return $A
}

Get-Gcd -A 48 -B 18
Get-Gcd -A 100 -B 75
