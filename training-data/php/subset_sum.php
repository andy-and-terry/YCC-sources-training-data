<?php

function subsetSum(array $nums, int $target): bool
{
    $dp = array_fill(0, $target + 1, false);
    $dp[0] = true;
    foreach ($nums as $num) {
        for ($s = $target; $s >= $num; $s--) {
            $dp[$s] = $dp[$s] || $dp[$s - $num];
        }
    }
    return $dp[$target];
}

$nums = [3, 34, 4, 12, 5, 2];
var_dump(subsetSum($nums, 9));
var_dump(subsetSum($nums, 21));
var_dump(subsetSum($nums, 100));
