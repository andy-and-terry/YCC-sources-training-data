<?php
// Primorials up to 1e6, including 1; expect 8.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$values = [1];
$acc = 1;
for ($p = 2; ; $p++) {
    if (!isPrime($p)) continue;
    $acc *= $p;
    if ($acc > 1000000) break;
    $values[] = $acc;
}
echo count($values), ': ', implode(' ', $values), PHP_EOL;
