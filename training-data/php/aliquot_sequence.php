<?php
declare(strict_types=1);

function properDivisorSum(int $n): int
{
    $sum = 0;
    for ($d = 1; $d <= intdiv($n, 2); $d++) {
        if ($n % $d === 0) {
            $sum += $d;
        }
    }
    return $sum;
}

$n = 12;
$seq = [$n];
while ($n !== 0) {
    $n = properDivisorSum($n);
    $seq[] = $n;
}
echo implode(' ', $seq), PHP_EOL;
