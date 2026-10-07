<?php

function threeSum(array $nums): array
{
    sort($nums);
    $n = count($nums);
    $results = [];
    for ($i = 0; $i < $n - 2; $i++) {
        if ($i > 0 && $nums[$i] === $nums[$i - 1]) {
            continue;
        }
        $left = $i + 1;
        $right = $n - 1;
        while ($left < $right) {
            $total = $nums[$i] + $nums[$left] + $nums[$right];
            if ($total === 0) {
                $results[] = [$nums[$i], $nums[$left], $nums[$right]];
                $left++;
                $right--;
                while ($left < $right && $nums[$left] === $nums[$left - 1]) {
                    $left++;
                }
                while ($left < $right && $nums[$right] === $nums[$right + 1]) {
                    $right--;
                }
            } elseif ($total < 0) {
                $left++;
            } else {
                $right--;
            }
        }
    }
    return $results;
}

foreach (threeSum([-1, 0, 1, 2, -1, -4]) as $triple) {
    echo implode(',', $triple) . "\n";
}
