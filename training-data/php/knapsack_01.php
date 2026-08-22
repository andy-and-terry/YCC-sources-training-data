<?php

function knapsack(array $weights, array $values, int $capacity): int
{
    $n = count($weights);
    $dp = array_fill(0, $n + 1, array_fill(0, $capacity + 1, 0));
    for ($i = 1; $i <= $n; $i++) {
        for ($w = 0; $w <= $capacity; $w++) {
            $dp[$i][$w] = $dp[$i - 1][$w];
            if ($weights[$i - 1] <= $w) {
                $dp[$i][$w] = max($dp[$i][$w], $dp[$i - 1][$w - $weights[$i - 1]] + $values[$i - 1]);
            }
        }
    }
    return $dp[$n][$capacity];
}

echo knapsack([1, 3, 4, 5], [1, 4, 5, 7], 7) . "\n";
