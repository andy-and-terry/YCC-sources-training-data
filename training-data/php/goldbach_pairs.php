<?php
// Goldbach partitions of 100; expect 6.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$pairs = [];
for ($p = 2; $p <= 50; $p++) if (isPrime($p) && isPrime(100 - $p)) $pairs[] = "$p+" . (100 - $p);
echo count($pairs), ': ', implode(' ', $pairs), PHP_EOL;
