<?php
$nums = range(1, 10);
$evens = array_filter($nums, fn($n) => $n % 2 === 0);
$squares = array_map(fn($n) => $n ** 2, $evens);
$total = array_reduce($squares, fn($carry, $n) => $carry + $n, 0);
echo implode(",", array_values($squares)), "\n";
echo "total=$total\n";
$words = ['apple', 'kiwi', 'banana'];
print_r(array_combine($words, array_map('strlen', $words)));
usort($words, fn($a, $b) => strlen($a) <=> strlen($b));
echo implode(" ", $words), "\n";
