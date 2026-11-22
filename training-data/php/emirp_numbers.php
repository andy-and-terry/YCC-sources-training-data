<?php
// Emirps: primes whose digit reversal is a different prime.
function is_prime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$out = [];
for ($n = 2; $n < 200; $n++) {
    $r = (int) strrev((string) $n);
    if ($r !== $n && is_prime($n) && is_prime($r)) $out[] = $n;
}
echo implode(" ", $out), "\n";
