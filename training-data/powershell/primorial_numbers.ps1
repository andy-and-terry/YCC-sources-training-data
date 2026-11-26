# Primorials up to 1e6, including 1; expect 8.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % $d -eq 0) { return $false } }
    return $true
}

$values = @(1)
$acc = 1
for ($p = 2; ; $p++) {
    if (-not (Test-Prime $p)) { continue }
    $acc *= $p
    if ($acc -gt 1000000) { break }
    $values += $acc
}
"$($values.Count): $($values -join ' ')"
