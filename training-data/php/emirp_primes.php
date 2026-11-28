<?php
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($i = 2; $i * $i <= $n; $i++) if ($n % $i === 0) return false;
    return true;
}

$out = [];
for ($p = 2; $p < 100; $p++) {
    $r = (int) strrev((string) $p);
    if (isPrime($p) && $r !== $p && isPrime($r)) $out[] = $p;
}
echo implode(' ', $out), "\n";
