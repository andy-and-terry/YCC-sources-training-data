<?php
declare(strict_types=1);

function pairWithSum(array $nums, int $target): ?array
{
    [$i, $j] = [0, count($nums) - 1];
    while ($i < $j) {
        $s = $nums[$i] + $nums[$j];
        if ($s === $target) return [$i, $j];
        $s < $target ? $i++ : $j--;
    }
    return null;
}

var_dump(pairWithSum([1, 3, 4, 6, 8, 11], 10), pairWithSum([1, 2, 3], 100));
