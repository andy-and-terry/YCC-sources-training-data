<?php

function subsetSum(array $nums, int $target): bool
{
    $n = count($nums);
    $dp = array_fill(0, $target + 1, false);
    $dp[0] = true;

    foreach ($nums as $num) {
        for ($sum = $target; $sum >= $num; $sum--) {
            if ($dp[$sum - $num]) {
                $dp[$sum] = true;
            }
        }
    }

    return $dp[$target];
}

$nums = [3, 34, 4, 12, 5, 2];
var_dump(subsetSum($nums, 9));
var_dump(subsetSum($nums, 10));
var_dump(subsetSum($nums, 40));
