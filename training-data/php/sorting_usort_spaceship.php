<?php
$p = [['n' => 'b', 'a' => 30], ['n' => 'a', 'a' => 30], ['n' => 'c', 'a' => 25]];
usort($p, fn($x, $y) => [$x['a'], $x['n']] <=> [$y['a'], $y['n']]);
echo implode(",", array_column($p, 'n')), "\n";
