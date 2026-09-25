<?php

function isArmstrong(int $n): bool
{
    $digits = str_split((string) $n);
    $k = count($digits);
    return array_sum(array_map(fn ($d) => (int) $d ** $k, $digits)) === $n;
}

echo implode(' ', array_filter(range(1, 999999), 'isArmstrong')), PHP_EOL;
