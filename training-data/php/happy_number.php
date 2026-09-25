<?php
declare(strict_types=1);

function isHappy(int $n): bool
{
    $seen = [];
    while ($n !== 1 && !isset($seen[$n])) {
        $seen[$n] = true;
        $n = array_sum(array_map(fn($d) => (int) $d ** 2, str_split((string) $n)));
    }
    return $n === 1;
}

echo implode(' ', array_filter(range(1, 50), 'isHappy')), PHP_EOL;
