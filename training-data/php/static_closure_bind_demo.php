<?php
class Counter {
    private int $count = 5;
}
$peek = function () {
    return $this->count;
};
$bound = Closure::bind($peek, new Counter(), Counter::class);
echo $bound(), "\n";

$multiplier = fn(int $m) => fn(int $x) => $x * $m;
$triple = $multiplier(3);
echo $triple(7), "\n";
