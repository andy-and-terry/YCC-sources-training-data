<?php
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($i = 2; $i * $i <= $n; $i++) {
        if ($n % $i === 0) return false;
    }
    return true;
}

$emirps = [];
for ($p = 2; $p < 200; $p++) {
    $r = (int)strrev((string)$p);
    if ($r !== $p && isPrime($p) && isPrime($r)) $emirps[] = $p;
}
echo implode(" ", $emirps), "\n"; // 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
