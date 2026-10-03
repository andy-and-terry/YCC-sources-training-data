<?php

function climbStairs(int $n): int
{
    if ($n <= 2) {
        return $n;
    }
    $a = 1;
    $b = 2;
    for ($i = 3; $i <= $n; $i++) {
        [$a, $b] = [$b, $a + $b];
    }
    return $b;
}

echo climbStairs(5) . "\n";
echo climbStairs(10) . "\n";
