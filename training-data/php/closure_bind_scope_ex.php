<?php
class Counter { private int $n = 41; }
$peek = function () { return ++$this->n; };
$bound = Closure::bind($peek, new Counter, Counter::class);
echo $bound(), "\n";
$mul = fn($x) => fn($y) => $x * $y;
echo $mul(6)(7), "\n";
