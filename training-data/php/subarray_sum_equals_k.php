<?php
// Count contiguous subarrays whose sum equals k (prefix sums + array map).
function countSubarrays(array $nums, int $k): int {
    $seen = [0 => 1];
    $total = $count = 0;
    foreach ($nums as $x) {
        $total += $x;
        $count += $seen[$total - $k] ?? 0;
        $seen[$total] = ($seen[$total] ?? 0) + 1;
    }
    return $count;
}

echo countSubarrays([1, 1, 1], 2), "\n";
