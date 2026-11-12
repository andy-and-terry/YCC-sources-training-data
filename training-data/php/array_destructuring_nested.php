<?php
[$a, [$b, $c]] = [1, [2, 3]];
['x' => $x, 'y' => $y] = ['x' => 10, 'y' => 20];
[, $second] = [1, 2];
echo "$a $b $c $x $y $second\n";
foreach ([[1, 'a'], [2, 'b']] as [$n, $l]) echo "$n$l ";
echo "\n";
