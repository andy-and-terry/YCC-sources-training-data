<?php

function phi(int $n): int
{
    $result = $n;
    for ($p = 2; $p * $p <= $n; $p++) {
        if ($n % $p !== 0) {
            continue;
        }
        while ($n % $p === 0) {
            $n = intdiv($n, $p);
        }
        $result -= intdiv($result, $p);
    }
    if ($n > 1) {
        $result -= intdiv($result, $n);
    }
    return $result;
}

function phiSieve(int $limit): array
{
    $t = range(0, $limit);
    for ($i = 2; $i <= $limit; $i++) {
        if ($t[$i] === $i) {
            for ($j = $i; $j <= $limit; $j += $i) {
                $t[$j] -= intdiv($t[$j], $i);
            }
        }
    }
    return $t;
}

$t = phiSieve(100000);
echo implode(' ', array_slice($t, 1, 20)), PHP_EOL;
echo 'sum phi(2..1e5) = ', array_sum(array_slice($t, 2)), ', phi(10^12) = ', phi(10 ** 12), PHP_EOL;
