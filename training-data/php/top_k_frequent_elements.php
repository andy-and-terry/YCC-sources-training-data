<?php

function topKFrequent(array $nums, int $k): array
{
    $freq = array_count_values($nums);
    arsort($freq);
    return array_slice(array_keys($freq), 0, $k);
}

$nums = [1, 1, 1, 2, 2, 3];
echo implode(',', topKFrequent($nums, 2)) . "\n";
