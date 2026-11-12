<?php
class Counter { private int $n = 5; }
$peek = function () { return $this->n; };
echo Closure::bind($peek, new Counter, Counter::class)(), "\n";
$mul = fn($k) => fn($x) => $x * $k;
echo $mul(3)(4), "\n";
