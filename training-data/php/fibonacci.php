<?php

function fibonacci(int $n, array &$cache = []): int
{
    if ($n < 2) {
        return $n;
    }
    if (isset($cache[$n])) {
        return $cache[$n];
    }
    return $cache[$n] = fibonacci($n - 1, $cache) + fibonacci($n - 2, $cache);
}

$values = array_map(fn($n) => fibonacci($n), range(0, 9));
echo implode(" ", $values) . "\n";
