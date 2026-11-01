<?php
// n is triangular iff 8n + 1 is a perfect square.
function isTriangular(int $n): bool {
    $s = 8 * $n + 1;
    $r = (int) round(sqrt($s));
    return $r * $r === $s;
}

echo implode(" ", array_filter(range(0, 20), 'isTriangular')), "\n";
