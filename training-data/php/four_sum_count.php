<?php
function fourSumCount(array $a, array $b, array $c, array $d): int {
    $sums = [];
    foreach ($a as $x) {
        foreach ($b as $y) {
            $sums[$x + $y] = ($sums[$x + $y] ?? 0) + 1;
        }
    }
    $count = 0;
    foreach ($c as $x) {
        foreach ($d as $y) {
            $count += $sums[-($x + $y)] ?? 0;
        }
    }
    return $count;
}

echo fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2]), "\n"; // 2
