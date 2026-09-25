<?php

function maxArea(array $h): array
{
    [$lo, $hi] = [0, count($h) - 1];
    $best = [0, 0, 0];
    while ($lo < $hi) {
        $area = ($hi - $lo) * min($h[$lo], $h[$hi]);
        if ($area > $best[0]) {
            $best = [$area, $lo, $hi];
        }
        $h[$lo] < $h[$hi] ? $lo++ : $hi--;
    }
    return $best;
}

[$area, $l, $r] = maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]);
echo "area $area between $l and $r", PHP_EOL;
