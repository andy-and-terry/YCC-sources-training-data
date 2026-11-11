<?php
function maxArea(array $h): int {
    $lo = 0;
    $hi = count($h) - 1;
    $best = 0;
    while ($lo < $hi) {
        $best = max($best, min($h[$lo], $h[$hi]) * ($hi - $lo));
        if ($h[$lo] < $h[$hi]) {
            $lo++;
        } else {
            $hi--;
        }
    }
    return $best;
}

echo maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]), "\n"; // 49
