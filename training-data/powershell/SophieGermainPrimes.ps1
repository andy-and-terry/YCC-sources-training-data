function Test-Prime([long]$n) {
    if ($n -lt 2) { return $false }
    for ($i = 2; $i * $i -le $n; $i++) { if ($n % $i -eq 0) { return $false } }
    return $true
}
$found = @()
for ($p = 2; $found.Count -lt 10; $p++) {
    if ((Test-Prime $p) -and (Test-Prime (2 * $p + 1))) { $found += $p }
}
$found -join ' ' # 2 3 5 11 23 29 41 53 83 89
