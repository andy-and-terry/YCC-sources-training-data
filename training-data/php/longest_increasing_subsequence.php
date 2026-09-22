<?php

function longestIncreasingSubsequence(array $nums): int
{
    if (count($nums) === 0) {
        return 0;
    }
    $dp = array_fill(0, count($nums), 1);
    for ($i = 1; $i < count($nums); $i++) {
        for ($j = 0; $j < $i; $j++) {
            if ($nums[$j] < $nums[$i]) {
                $dp[$i] = max($dp[$i], $dp[$j] + 1);
            }
        }
    }
    return max($dp);
}

echo longestIncreasingSubsequence([10, 9, 2, 5, 3, 7, 101, 18]) . "\n";
echo longestIncreasingSubsequence([0, 1, 0, 3, 2, 3]) . "\n";
echo longestIncreasingSubsequence([7, 7, 7, 7]) . "\n";
