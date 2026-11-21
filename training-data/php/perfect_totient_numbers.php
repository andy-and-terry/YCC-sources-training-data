<?php
// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
function gcd(int $a, int $b): int {
    return $b === 0 ? $a : gcd($b, $a % $b);
}

function phi(int $n): int {
    $c = 0;
    for ($k = 1; $k <= $n; $k++) {
        if (gcd($k, $n) === 1) $c++;
    }
    return $c;
}

function isPerfectTotient(int $n): bool {
    $total = 0;
    for ($m = $n; $m > 1;) {
        $m = phi($m);
        $total += $m;
    }
    return $total === $n;
}

$out = [];
for ($n = 2; $n < 200; $n++) {
    if (isPerfectTotient($n)) $out[] = $n;
}
echo implode(" ", $out), "\n";
