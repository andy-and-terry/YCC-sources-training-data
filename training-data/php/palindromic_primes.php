<?php
// Palindromic primes below 200; expect 10.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$found = [];
for ($n = 2; $n < 200; $n++) {
    if ((string) $n === strrev((string) $n) && isPrime($n)) $found[] = $n;
}
echo implode(' ', $found), PHP_EOL, count($found), PHP_EOL;
