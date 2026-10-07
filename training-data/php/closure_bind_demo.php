<?php

class Counter
{
    private int $count = 5;
}

// Bind a closure to an object so it can read private state.
$peek = function () {
    return $this->count;
};
$bound = Closure::bind($peek, new Counter(), Counter::class);
echo $bound(), "\n";

$c = new Counter();
$inc = Closure::bind(function () { return ++$this->count; }, $c, Counter::class);
$inc();
echo $inc(), "\n";

$static = static fn(int $x): int => $x * 2;
echo $static(21), "\n";
