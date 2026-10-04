<?php

class Counter
{
    private int $count = 5;
}

$peek = function () {
    return $this->count;
};

$bound = Closure::bind($peek, new Counter(), Counter::class);
echo $bound() . "\n";

$incr = function (int $by) {
    $this->count += $by;
    return $this->count;
};
$counter = new Counter();
echo $incr->call($counter, 3) . "\n";
echo $incr->call($counter, 2) . "\n";

$multiplier = fn(int $x) => fn(int $y) => $x * $y;
echo $multiplier(6)(7) . "\n";

$static = static fn(int $n): int => $n * $n;
echo $static(9) . "\n";
