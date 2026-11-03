<?php
function isPerfectSquare(int $n): bool {
    if ($n < 0) return false;
    $r = (int) sqrt($n);
    return $r * $r === $n;
}

echo implode(" ", array_filter(range(0, 29), 'isPerfectSquare')), PHP_EOL;
