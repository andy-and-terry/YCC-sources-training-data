<?php

function extendedGcd(int $a, int $b): array
{
    if ($b === 0) {
        return [$a, 1, 0];
    }

    [$gcd, $x1, $y1] = extendedGcd($b, $a % $b);
    $x = $y1;
    $y = $x1 - intdiv($a, $b) * $y1;

    return [$gcd, $x, $y];
}

[$gcd, $x, $y] = extendedGcd(30, 20);
echo "gcd=$gcd x=$x y=$y\n";
echo 'check: ' . (30 * $x + 20 * $y) . "\n";

[$gcd2, $x2, $y2] = extendedGcd(240, 46);
echo "gcd=$gcd2 x=$x2 y=$y2\n";
