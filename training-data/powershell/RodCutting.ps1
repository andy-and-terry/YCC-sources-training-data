function Get-MaxRodRevenue {
    param([int[]]$Prices, [int]$Length)

    $revenue = [int[]]::new($Length + 1)
    for ($i = 1; $i -le $Length; $i++) {
        $best = [int]::MinValue
        for ($cut = 1; $cut -le $i; $cut++) {
            $candidate = $Prices[$cut - 1] + $revenue[$i - $cut]
            if ($candidate -gt $best) { $best = $candidate }
        }
        $revenue[$i] = $best
    }
    return $revenue[$Length]
}

Get-MaxRodRevenue -Prices @(1, 5, 8, 9, 10, 17, 17, 20) -Length 8
