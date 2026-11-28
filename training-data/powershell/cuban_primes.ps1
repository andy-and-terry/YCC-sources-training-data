function Test-Prime([long]$n) {
    if ($n -lt 2) { return $false }
    for ($i = 2; $i * $i -le $n; $i++) { if ($n % $i -eq 0) { return $false } }
    $true
}

$found = @()
$y = 1
while ($found.Count -lt 8) {
    $p = 3 * $y * $y + 3 * $y + 1
    if (Test-Prime $p) { $found += $p }
    $y++
}
$found -join ' '
