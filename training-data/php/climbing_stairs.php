<?php

function ways(int $n, array $steps = [1, 2]): int
{
    $dp = array_fill(0, $n + 1, 0);
    $dp[0] = 1;
    for ($i = 1; $i <= $n; $i++) {
        foreach ($steps as $s) {
            if ($s <= $i) {
                $dp[$i] += $dp[$i - $s];
            }
        }
    }
    return $dp[$n];
}

function minCost(array $cost): int
{
    [$a, $b] = [0, 0];
    foreach ($cost as $c) {
        [$a, $b] = [$b, min($a, $b) + $c];
    }
    return min($a, $b);
}

echo implode(' ', array_map(fn ($n) => ways($n), range(1, 10))), PHP_EOL;
echo ways(80), ' ', ways(10, [1, 3, 5]), PHP_EOL;
echo minCost([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]), PHP_EOL;
