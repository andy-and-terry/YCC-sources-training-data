# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
function Test-Hamming([int]$n) {
    foreach ($p in 2, 3, 5) {
        while ($n % $p -eq 0) { $n = $n / $p }
    }
    return $n -eq 1
}

$found = @()
for ($n = 1; $found.Count -lt 20; $n++) {
    if (Test-Hamming $n) { $found += $n }
}
Write-Output ($found -join ' ')
