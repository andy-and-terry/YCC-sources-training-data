<?php

function maxSubarray(array $nums): int
{
    $best = $current = $nums[0];
    for ($i = 1; $i < count($nums); $i++) {
        $current = max($nums[$i], $current + $nums[$i]);
        $best = max($best, $current);
    }
    return $best;
}

echo maxSubarray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) . "\n";
