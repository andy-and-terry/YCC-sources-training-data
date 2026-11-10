<?php
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($i = 2; $i * $i <= $n; $i++) if ($n % $i === 0) return false;
    return true;
}
$out = [];
for ($n = 2; count($out) < 10; $n++) {
    $r = (int) strrev((string) $n);
    if ($r !== $n && isPrime($n) && isPrime($r)) $out[] = $n;
}
echo implode(" ", $out), "\n"; // 13 17 31 37 71 73 79 97 107 113
