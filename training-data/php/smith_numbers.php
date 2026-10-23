<?php
declare(strict_types=1);

function digitSum(int $n): int
{
    return array_sum(str_split((string)$n));
}

function isSmith(int $n): bool
{
    $sum = 0;
    $m = $n;
    for ($p = 2; $p * $p <= $m; $p++) {
        while ($m % $p === 0) {
            $sum += digitSum($p);
            $m = intdiv($m, $p);
        }
    }
    if ($m === $n) {
        return false; // prime
    }
    if ($m > 1) {
        $sum += digitSum($m);
    }
    return $sum === digitSum($n);
}

$result = array_filter(range(2, 99), 'isSmith');
echo implode(' ', $result), PHP_EOL;
