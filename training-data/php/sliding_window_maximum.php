<?php

function slidingWindowMaximum(array $nums, int $k): array
{
    $result = [];
    $deque = [];

    foreach ($nums as $i => $value) {
        while (!empty($deque) && $nums[end($deque)] < $value) {
            array_pop($deque);
        }
        $deque[] = $i;

        if ($deque[0] <= $i - $k) {
            array_shift($deque);
        }

        if ($i >= $k - 1) {
            $result[] = $nums[$deque[0]];
        }
    }

    return $result;
}

$nums = [1, 3, -1, -3, 5, 3, 6, 7];
echo implode(' ', slidingWindowMaximum($nums, 3)) . "\n";
