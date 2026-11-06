<?php
// Emirps: primes whose digit reversal is a different prime.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($i = 2; $i * $i <= $n; $i++) {
        if ($n % $i === 0) return false;
    }
    return true;
}

$emirps = array_filter(range(2, 99), function ($n) {
    $r = (int) strrev((string) $n);
    return $r !== $n && isPrime($n) && isPrime($r);
});

echo implode(" ", $emirps), "\n";
