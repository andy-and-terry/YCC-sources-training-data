<?php
function equilibriumIndex(array $nums): int {
    $total = array_sum($nums);
    $left = 0;
    foreach ($nums as $i => $v) {
        if ($left === $total - $left - $v) {
            return $i;
        }
        $left += $v;
    }
    return -1;
}

echo equilibriumIndex([1, 7, 3, 6, 5, 6]), "\n"; // 3
