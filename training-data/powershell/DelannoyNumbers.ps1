function Get-CentralDelannoy([int]$n) {
    $g = New-Object 'long[,]' ($n + 1), ($n + 1)
    for ($i = 0; $i -le $n; $i++) {
        for ($j = 0; $j -le $n; $j++) {
            if ($i -eq 0 -or $j -eq 0) { $g[$i, $j] = 1 }
            else { $g[$i, $j] = $g[($i - 1), $j] + $g[$i, ($j - 1)] + $g[($i - 1), ($j - 1)] }
        }
    }
    $g[$n, $n]
}
(0..5 | ForEach-Object { Get-CentralDelannoy $_ }) -join ' ' # 1 3 13 63 321 1683
