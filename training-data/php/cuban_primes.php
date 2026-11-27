<?php
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($i = 2; $i * $i <= $n; $i++) if ($n % $i === 0) return false;
    return true;
}

function cuban(): Generator {
    for ($y = 1; ; $y++) {
        $p = 3 * $y * $y + 3 * $y + 1;
        if (isPrime($p)) yield $p;
    }
}

foreach (cuban() as $i => $p) {
    if ($i >= 8) break;
    echo $p, ' ';
}
echo "\n";
