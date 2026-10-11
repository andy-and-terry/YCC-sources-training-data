<?php

function memoize(callable $fn): callable
{
    $cache = [];
    return function (...$args) use (&$cache, $fn) {
        $key = serialize($args);
        if (!array_key_exists($key, $cache)) {
            $cache[$key] = $fn(...$args);
        }
        return $cache[$key];
    };
}

$calls = 0;
$slowSquare = function (int $n) use (&$calls) {
    $calls++;
    return $n * $n;
};

$fast = memoize($slowSquare);
echo $fast(9) . ' ' . $fast(9) . ' ' . $fast(10) . "\n";
echo "underlying calls: $calls\n";
