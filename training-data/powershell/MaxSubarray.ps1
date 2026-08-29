function Get-Kadane {
    param([int[]]$Items)

    $best = $Items[0]
    $current = $Items[0]
    for ($i = 1; $i -lt $Items.Count; $i++) {
        $current = [math]::Max($Items[$i], $current + $Items[$i])
        $best = [math]::Max($best, $current)
    }
    return $best
}

Get-Kadane -Items @(-2, 1, -3, 4, -1, 2, 1, -5, 4)
