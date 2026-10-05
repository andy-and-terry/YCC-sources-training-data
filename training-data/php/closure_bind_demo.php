<?php

class Counter
{
    private int $count = 5;
}

$peek = function () {
    return $this->count;
};

$bound = Closure::bind($peek, new Counter(), Counter::class);
echo $bound(), "\n";

$inc = fn(int $by) => fn(int $x) => $x + $by;
echo $inc(10)(5), "\n";

$multiplier = 3;
$byValue = function ($x) use ($multiplier) { return $x * $multiplier; };
$byRef = function ($x) use (&$multiplier) { return $x * $multiplier; };
$multiplier = 4;
echo $byValue(2), " ", $byRef(2), "\n";

$static = static fn() => isset($this);
var_dump($static());
