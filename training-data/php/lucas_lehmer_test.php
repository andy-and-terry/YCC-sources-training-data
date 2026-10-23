<?php
declare(strict_types=1);

function lucasLehmer(int $p): bool
{
    if ($p === 2) {
        return true;
    }
    $m = (1 << $p) - 1;
    $s = 4;
    for ($i = 0; $i < $p - 2; $i++) {
        $s = ($s * $s - 2) % $m;
    }
    return $s === 0;
}

$exponents = array_filter([2, 3, 5, 7, 11, 13, 17, 19], 'lucasLehmer');
echo implode(' ', $exponents), PHP_EOL;
