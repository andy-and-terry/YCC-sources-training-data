<?php
// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
function gcd(int $a, int $b): int {
    return $b === 0 ? $a : gcd($b, $a % $b);
}

function powMod(int $b, int $e, int $m): int {
    $r = 1;
    $b %= $m;
    while ($e > 0) {
        if ($e & 1) $r = $r * $b % $m;
        $b = $b * $b % $m;
        $e >>= 1;
    }
    return $r;
}

function isPrime(int $n): bool {
    for ($p = 2; $p * $p <= $n; $p++) {
        if ($n % $p === 0) return false;
    }
    return $n > 1;
}

function isCarmichael(int $n): bool {
    if (isPrime($n)) return false;
    for ($a = 2; $a < $n; $a++) {
        if (gcd($a, $n) === 1 && powMod($a, $n - 1, $n) !== 1) return false;
    }
    return true;
}

$out = [];
for ($n = 3; $n < 3000; $n += 2) {
    if (isCarmichael($n)) $out[] = $n;
}
echo implode(" ", $out), "\n";
