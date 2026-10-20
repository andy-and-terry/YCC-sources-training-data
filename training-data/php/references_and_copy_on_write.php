<?php
function addOne(array &$a) { $a[] = 1; }
$x = [];
addOne($x); addOne($x);
echo count($x), PHP_EOL;

$a = [1, 2, 3];
foreach ($a as &$v) $v *= 2;
unset($v);
echo implode(',', $a), PHP_EOL;

$o1 = new stdClass; $o1->v = 1;
$o2 = $o1; $o2->v = 2;
$o3 = clone $o1; $o3->v = 3;
echo $o1->v, $o3->v, PHP_EOL;
