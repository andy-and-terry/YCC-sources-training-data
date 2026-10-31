function Get-CubeFromOdds([long]$n) {
    $start = $n * $n - $n + 1
    $sum = 0
    for ($i = 0; $i -lt $n; $i++) { $sum += $start + 2 * $i }
    return $sum
}

foreach ($n in 1..5) {
    "$n $(Get-CubeFromOdds $n) $((Get-CubeFromOdds $n) -eq $n * $n * $n)"
}
