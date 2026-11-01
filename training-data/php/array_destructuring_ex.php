<?php
[$a, [$b, $c]] = [1, [2, 3]];
['x' => $x, 'y' => $y] = ['x' => 10, 'y' => 20];
echo "$a $b $c $x $y\n";
[$a, $b] = [$b, $a];
echo "$a $b\n";
foreach ([[1, 'one'], [2, 'two']] as [$n, $w]) echo "$n=$w\n";
