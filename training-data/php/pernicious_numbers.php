<?php
// Pernicious numbers: the popcount is prime.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) {
        if ($n % $d === 0) return false;
    }
    return true;
}

$out = array_filter(range(1, 20), fn($n) => isPrime(substr_count(decbin($n), "1")));
echo implode(" ", $out), "\n";
