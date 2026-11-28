function Get-MaxArea {
    param([int[]]$H)
    $lo = 0; $hi = $H.Count - 1; $best = 0
    while ($lo -lt $hi) {
        $area = [Math]::Min($H[$lo], $H[$hi]) * ($hi - $lo)
        if ($area -gt $best) { $best = $area }
        if ($H[$lo] -lt $H[$hi]) { $lo++ } else { $hi-- }
    }
    $best
}

Get-MaxArea 1, 8, 6, 2, 5, 4, 8, 3, 7   # 49
