# Sophie Germain primes: p prime and 2p + 1 prime.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % $d -eq 0) { return $false } }
    return $true
}

(2..99 | Where-Object { (Test-Prime $_) -and (Test-Prime (2 * $_ + 1)) }) -join ' '
