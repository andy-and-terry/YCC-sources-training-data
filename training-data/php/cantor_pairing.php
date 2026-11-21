<?php
// Cantor pairing function and its inverse.
function pair(int $x, int $y): int {
    return intdiv(($x + $y) * ($x + $y + 1), 2) + $y;
}

function unpair(int $z): array {
    $w = intdiv((int)sqrt(8 * $z + 1) - 1, 2);
    $y = $z - intdiv($w * ($w + 1), 2);
    return [$w - $y, $y];
}

echo pair(3, 4), "\n";
echo implode(" ", unpair(32)), "\n";
