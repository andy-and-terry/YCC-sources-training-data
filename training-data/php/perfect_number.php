<?php

function divisorSum(int $n): int
{
    if ($n < 2) {
        return 0;
    }
    $sum = 1;
    for ($i = 2; $i * $i <= $n; $i++) {
        if ($n % $i === 0) {
            $sum += $i;
            if ($i !== intdiv($n, $i)) {
                $sum += intdiv($n, $i);
            }
        }
    }
    return $sum;
}

function classify(int $n): string
{
    return match (divisorSum($n) <=> $n) {
        0 => 'perfect',
        1 => 'abundant',
        -1 => 'deficient',
    };
}

echo 'perfect < 10000: ', implode(', ', array_filter(range(2, 9999), fn ($n) => divisorSum($n) === $n)), PHP_EOL;
foreach ([12, 28, 35] as $n) {
    echo "$n is ", classify($n), PHP_EOL;
}
