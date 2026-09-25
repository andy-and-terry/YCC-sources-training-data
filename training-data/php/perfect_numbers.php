<?php
declare(strict_types=1);

function aliquotSum(int $n): int
{
    if ($n === 1) return 0;
    $sum = 1;
    for ($i = 2; $i * $i <= $n; $i++) {
        if ($n % $i === 0) {
            $sum += $i;
            if ($i !== intdiv($n, $i)) $sum += intdiv($n, $i);
        }
    }
    return $sum;
}

function classify(int $n): string
{
    return match (aliquotSum($n) <=> $n) {
        0 => 'perfect',
        1 => 'abundant',
        -1 => 'deficient',
    };
}

foreach ([6, 12, 28, 13, 8128] as $n) echo "$n ", classify($n), PHP_EOL;
