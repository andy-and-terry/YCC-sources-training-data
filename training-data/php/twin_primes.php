<?php
// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
function is_prime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$out = array_filter(range(2, 99), fn($p) => is_prime($p) && is_prime($p + 2));
echo implode(" ", $out), "\n";
