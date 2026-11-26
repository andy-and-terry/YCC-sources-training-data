# Squarefree numbers up to 100; expect 61.
function Test-Squarefree([int]$n) {
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % ($d * $d) -eq 0) { return $false } }
    return $true
}
@(1..100 | Where-Object { Test-Squarefree $_ }).Count
