<?php
$rows = [['n' => 'b', 'a' => 30], ['n' => 'a', 'a' => 25], ['n' => 'c', 'a' => 30]];
usort($rows, fn($x, $y) => [$y['a'], $x['n']] <=> [$x['a'], $y['n']]);
echo implode(',', array_column($rows, 'n')), "\n";
print_r(array_count_values(array_column($rows, 'a')));
