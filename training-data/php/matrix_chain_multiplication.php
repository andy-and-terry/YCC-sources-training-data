<?php

function matrixChainOrder(array $dims): int
{
    $n = count($dims) - 1;
    $dp = array_fill(0, $n + 1, array_fill(0, $n + 1, 0));

    for ($len = 2; $len <= $n; $len++) {
        for ($i = 1; $i <= $n - $len + 1; $i++) {
            $j = $i + $len - 1;
            $dp[$i][$j] = PHP_INT_MAX;
            for ($k = $i; $k < $j; $k++) {
                $cost = $dp[$i][$k] + $dp[$k + 1][$j] + $dims[$i - 1] * $dims[$k] * $dims[$j];
                if ($cost < $dp[$i][$j]) {
                    $dp[$i][$j] = $cost;
                }
            }
        }
    }
    return $dp[1][$n];
}

// dims describes matrices of size dims[i-1] x dims[i]
$dims = [40, 20, 30, 10, 30];
echo matrixChainOrder($dims) . "\n";
