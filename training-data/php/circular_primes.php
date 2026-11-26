<?php
// Circular primes below 100; expect 13.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
function circular(int $n): bool {
    $s = (string) $n;
    for ($i = 0; $i < strlen($s); $i++) {
        if (!isPrime((int) (substr($s, $i) . substr($s, 0, $i)))) return false;
    }
    return true;
}
$c = 0;
for ($n = 2; $n < 100; $n++) if (circular($n)) $c++;
echo $c, PHP_EOL;
