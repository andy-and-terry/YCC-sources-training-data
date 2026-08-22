<?php

function makeAdder(int $n): callable
{
    return fn (int $x) => $x + $n;
}

function makeCounter(): callable
{
    $count = 0;
    return function () use (&$count) {
        return ++$count;
    };
}

$add5 = makeAdder(5);
echo $add5(10) . "\n";

$counter = makeCounter();
echo $counter() . ' ' . $counter() . ' ' . $counter() . "\n";
