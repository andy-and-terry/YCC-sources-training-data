<?php
class Counter { private int $count = 41; }

// Closure::bind runs a closure with another object's private scope.
$peek = function () { return ++$this->count; };
$bound = Closure::bind($peek, new Counter, Counter::class);
echo $bound(), "\n";

$mult = fn(int $f) => fn(int $x) => $x * $f;
echo $mult(3)(7), "\n";
$total = 0;
$add = function (int $n) use (&$total) { $total += $n; };
$add(5); $add(6);
echo $total, "\n";
