function Get-Escape([double]$cr, [double]$ci) {
    $zr = 0.0; $zi = 0.0
    for ($n = 0; $n -lt 30; $n++) {
        if ($zr * $zr + $zi * $zi -ge 4) { return $n }
        $t = $zr * $zr - $zi * $zi + $cr
        $zi = 2 * $zr * $zi + $ci
        $zr = $t
    }
    return 30
}
foreach ($yi in -5..5) {
    -join (-40..12 | ForEach-Object { if ((Get-Escape ($_ / 20) ($yi / 5)) -eq 30) { '#' } else { '.' } })
}
