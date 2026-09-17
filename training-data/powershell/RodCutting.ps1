function Get-MaxRodRevenue {
    param([int[]]$Price, [int]$Length)

    $dp = @(0) * ($Length + 1)
    for ($len = 1; $len -le $Length; $len++) {
        $best = -1
        for ($cut = 1; $cut -le $len; $cut++) {
            $candidate = $Price[$cut - 1] + $dp[$len - $cut]
            if ($candidate -gt $best) { $best = $candidate }
        }
        $dp[$len] = $best
    }
    return $dp[$Length]
}

$prices = @(1, 5, 8, 9, 10, 17, 17, 20)
Get-MaxRodRevenue -Price $prices -Length 8
