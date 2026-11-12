<?php
$rows = [['id' => 1, 'n' => 'a', 'p' => 5], ['id' => 2, 'n' => 'b', 'p' => 7]];
print_r(array_column($rows, 'n', 'id'));
echo array_sum(array_column($rows, 'p')), "\n";
echo array_reduce($rows, fn($c, $r) => $c . $r['n'], ""), "\n";
