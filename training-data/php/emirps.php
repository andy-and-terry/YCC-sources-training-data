<?php
// Emirps below 200; expect 15.
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}
$found = [];
for ($n = 2; $n < 200; $n++) {
    $r = (int) strrev((string) $n);
    if ($r !== $n && isPrime($n) && isPrime($r)) $found[] = $n;
}
echo count($found), ': ', implode(' ', $found), PHP_EOL;
