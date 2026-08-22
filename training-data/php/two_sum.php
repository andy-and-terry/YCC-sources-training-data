<?php

function twoSum(array $nums, int $target): ?array
{
    $seen = [];
    foreach ($nums as $i => $num) {
        $complement = $target - $num;
        if (isset($seen[$complement])) {
            return [$seen[$complement], $i];
        }
        $seen[$num] = $i;
    }
    return null;
}

print_r(twoSum([2, 7, 11, 15], 9));
