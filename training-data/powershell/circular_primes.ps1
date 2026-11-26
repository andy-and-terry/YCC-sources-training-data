# Circular primes below 100; expect 13.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % $d -eq 0) { return $false } }
    return $true
}

function Test-Circular([int]$n) {
    $s = "$n"
    for ($i = 0; $i -lt $s.Length; $i++) {
        if (-not (Test-Prime ([int]($s.Substring($i) + $s.Substring(0, $i))))) { return $false }
    }
    return $true
}
@(2..99 | Where-Object { Test-Circular $_ }).Count
