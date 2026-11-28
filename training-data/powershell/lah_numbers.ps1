function Get-Lah([int]$n, [int]$k) {
    $c = 1; $f = 1
    for ($i = 0; $i -lt $k - 1; $i++) { $c = $c * ($n - 1 - $i) / ($i + 1) }
    for ($i = $k + 1; $i -le $n; $i++) { $f *= $i }
    [long]($c * $f)
}

foreach ($n in 1..5) {
    (1..$n | ForEach-Object { Get-Lah $n $_ }) -join ' '
}
