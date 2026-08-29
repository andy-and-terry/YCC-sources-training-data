function Get-Primes {
    param([int]$Limit)

    $isComposite = New-Object bool[] ($Limit + 1)
    for ($i = 2; $i * $i -le $Limit; $i++) {
        if (-not $isComposite[$i]) {
            for ($j = $i * $i; $j -le $Limit; $j += $i) {
                $isComposite[$j] = $true
            }
        }
    }
    2..$Limit | Where-Object { -not $isComposite[$_] }
}

Get-Primes -Limit 50
