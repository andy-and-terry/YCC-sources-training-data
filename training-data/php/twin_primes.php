<?php
// Twin primes below 100; expect 8.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$c = 0;
for ($p = 2; $p < 100; $p++) if (isPrime($p) && isPrime($p + 2)) $c++;
echo $c, PHP_EOL;
