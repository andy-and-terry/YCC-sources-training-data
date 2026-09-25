<?php

function maxProduct(array $a): int
{
    $best = $hi = $lo = $a[0];
    foreach (array_slice($a, 1) as $x) {
        if ($x < 0) {
            [$hi, $lo] = [$lo, $hi];
        }
        $hi = max($x, $hi * $x);
        $lo = min($x, $lo * $x);
        $best = max($best, $hi);
    }
    return $best;
}

foreach ([[2, 3, -2, 4], [-2, 0, -1], [-2, 3, -4], [1, -2, -3, 0, 7, -8, -2]] as $a) {
    echo json_encode($a), ' -> ', maxProduct($a), PHP_EOL;
}
