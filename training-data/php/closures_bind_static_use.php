<?php
class Counter { private int $n = 5; }

$peek = function () { return $this->n; };
echo Closure::bind($peek, new Counter, Counter::class)(), PHP_EOL;

$total = 0;
$add = function (int $x) use (&$total) { $total += $x; };
array_map($add, [1, 2, 3]);
echo $total, PHP_EOL;

$mul = fn(int $x) => fn(int $y) => $x * $y;
echo $mul(3)(4), PHP_EOL;
