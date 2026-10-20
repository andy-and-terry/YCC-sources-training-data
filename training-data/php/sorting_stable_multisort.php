<?php
$rows = [['n' => 'b', 's' => 2], ['n' => 'a', 's' => 2], ['n' => 'c', 's' => 1]];
usort($rows, fn($x, $y) => [$y['s'], $x['n']] <=> [$x['s'], $y['n']]);
echo implode(',', array_column($rows, 'n')), PHP_EOL;
$a = [3, 1, 2]; $b = ['c', 'a', 'b'];
array_multisort($a, $b);
echo implode($b), PHP_EOL;
$m = ['x' => 3, 'y' => 1, 'z' => 2];
asort($m); echo implode(',', array_keys($m)), PHP_EOL;
krsort($m); echo implode(',', array_keys($m)), PHP_EOL;
$w = ['img12', 'img10', 'img2'];
natsort($w); echo implode(',', $w), PHP_EOL;
