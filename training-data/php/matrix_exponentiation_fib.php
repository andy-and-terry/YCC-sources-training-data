<?php

const MOD = 1_000_000_007;

function matMul(array $a, array $b): array
{
    return [
        [($a[0][0] * $b[0][0] + $a[0][1] * $b[1][0]) % MOD, ($a[0][0] * $b[0][1] + $a[0][1] * $b[1][1]) % MOD],
        [($a[1][0] * $b[0][0] + $a[1][1] * $b[1][0]) % MOD, ($a[1][0] * $b[0][1] + $a[1][1] * $b[1][1]) % MOD],
    ];
}

function fib(int $n): int
{
    [$r, $m] = [[[1, 0], [0, 1]], [[1, 1], [1, 0]]];
    for (; $n > 0; $n >>= 1) {
        if ($n & 1) {
            $r = matMul($r, $m);
        }
        $m = matMul($m, $m);
    }
    return $r[0][1];
}

echo implode(' ', array_map('fib', range(0, 14))), PHP_EOL;
echo 'fib(10^18) mod p = ', fib(10 ** 18), PHP_EOL;
