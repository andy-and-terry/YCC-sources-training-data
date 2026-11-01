<?php
// Ways to write n as a sum of two or more consecutive positive integers.
function politeWays(int $n): int {
    $ways = 0;
    for ($k = 2; intdiv($k * ($k + 1), 2) <= $n; $k++) {
        if (($n - intdiv($k * ($k - 1), 2)) % $k === 0) $ways++;
    }
    return $ways;
}

echo implode(" ", array_map('politeWays', range(1, 16))), "\n";
