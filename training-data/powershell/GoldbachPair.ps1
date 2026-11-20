# Goldbach pair.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % $d -eq 0) { return $false } }
    $true
}
$n = 28
foreach ($p in 2..($n / 2)) {
    if ((Test-Prime $p) -and (Test-Prime ($n - $p))) { "$p + $($n - $p)"; break }
}
