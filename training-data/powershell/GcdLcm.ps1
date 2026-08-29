function Get-Gcd {
    param([int]$A, [int]$B)

    while ($B -ne 0) {
        $t = $B
        $B = $A % $B
        $A = $t
    }
    return [math]::Abs($A)
}

function Get-Lcm {
    param([int]$A, [int]$B)

    return [math]::Abs($A * $B) / (Get-Gcd $A $B)
}

Get-Gcd -A 48 -B 18
Get-Lcm -A 4 -B 6
