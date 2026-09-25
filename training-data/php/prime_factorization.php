<?php

function factorize(int $n): array
{
    $f = [];
    for ($p = 2; $p * $p <= $n; $p += $p === 2 ? 1 : 2) {
        while ($n % $p === 0) {
            $f[$p] = ($f[$p] ?? 0) + 1;
            $n = intdiv($n, $p);
        }
    }
    if ($n > 1) {
        $f[$n] = ($f[$n] ?? 0) + 1;
    }
    return $f;
}

function format(array $f): string
{
    return implode(' * ', array_map(fn ($p, $e) => $e > 1 ? "$p^$e" : "$p", array_keys($f), $f));
}

foreach ([360, 97, 1001, 600851475143, 2 ** 20] as $n) {
    $f = factorize($n);
    $divisors = array_product(array_map(fn ($e) => $e + 1, $f));
    echo "$n = ", format($f), " ($divisors divisors)", PHP_EOL;
}
