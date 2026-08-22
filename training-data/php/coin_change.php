<?php

function coinChange(array $coins, int $amount): int
{
    $dp = array_fill(0, $amount + 1, PHP_INT_MAX);
    $dp[0] = 0;
    for ($a = 1; $a <= $amount; $a++) {
        foreach ($coins as $coin) {
            if ($coin <= $a && $dp[$a - $coin] !== PHP_INT_MAX) {
                $dp[$a] = min($dp[$a], $dp[$a - $coin] + 1);
            }
        }
    }
    return $dp[$amount] === PHP_INT_MAX ? -1 : $dp[$amount];
}

echo coinChange([1, 2, 5], 11) . "\n";
