<?php
function gcd(int $a, int $b): int { return $b === 0 ? $a : gcd($b, $a % $b); }

function rho(int $n): int {
    if ($n % 2 === 0) return 2;
    $f = fn(int $v): int => ($v * $v + 1) % $n;
    $x = $y = 2; $d = 1;
    while ($d === 1) {
        $x = $f($x);
        $y = $f($f($y));
        $d = gcd(abs($x - $y), $n);
    }
    return $d;
}

$n = 8051;
$p = rho($n);
echo "$n = $p * ", intdiv($n, $p), "\n";
