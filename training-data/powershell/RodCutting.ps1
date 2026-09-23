function Get-MaxRevenue {
    param([int[]]$Prices, [int]$RodLength)

    $dp = New-Object int[] ($RodLength + 1)
    for ($n = 1; $n -le $RodLength; $n++) {
        $best = 0
        for ($i = 1; $i -le $n; $i++) {
            $candidate = $Prices[$i - 1] + $dp[$n - $i]
            if ($candidate -gt $best) { $best = $candidate }
        }
        $dp[$n] = $best
    }
    return $dp[$RodLength]
}

$prices = @(1, 5, 8, 9, 10, 17, 17, 20)
Get-MaxRevenue -Prices $prices -RodLength 8
Get-MaxRevenue -Prices $prices -RodLength 4
