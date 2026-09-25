<?php

$a = [4, 9, 5, 4, 4];
$b = [9, 4, 9, 8, 4];

$unique = array_values(array_unique(array_intersect($a, $b)));
sort($unique);
echo 'unique: ', implode(' ', $unique), PHP_EOL;

$counts = array_count_values($a);
$multi = [];
foreach ($b as $x) {
    if (($counts[$x] ?? 0) > 0) {
        $multi[] = $x;
        $counts[$x]--;
    }
}
echo 'multiset: ', implode(' ', $multi), PHP_EOL;
echo 'a - b: ', implode(' ', array_values(array_unique(array_diff($a, $b)))), PHP_EOL;
