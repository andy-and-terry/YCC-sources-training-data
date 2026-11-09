<?php
$nums = [5, 3, 8, 1];
print_r(array_map(fn($n) => $n * 2, $nums));
print_r(array_filter($nums, fn($n) => $n > 3));
echo array_sum($nums), "\n";
usort($nums, fn($a, $b) => $a <=> $b);
echo implode(",", $nums), "\n";
