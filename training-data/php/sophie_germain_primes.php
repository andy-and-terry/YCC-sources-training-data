<?php
// Sophie Germain primes: p prime and 2p + 1 prime.
function is_prime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$out = array_filter(range(2, 99), fn($p) => is_prime($p) && is_prime(2 * $p + 1));
echo implode(" ", $out), "\n";
