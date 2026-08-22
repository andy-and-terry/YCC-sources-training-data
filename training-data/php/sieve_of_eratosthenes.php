<?php

function sieve(int $limit): array
{
    $isPrime = array_fill(0, $limit + 1, true);
    $isPrime[0] = $isPrime[1] = false;
    for ($n = 2; $n * $n <= $limit; $n++) {
        if ($isPrime[$n]) {
            for ($multiple = $n * $n; $multiple <= $limit; $multiple += $n) {
                $isPrime[$multiple] = false;
            }
        }
    }
    return array_keys(array_filter($isPrime));
}

print_r(sieve(50));
