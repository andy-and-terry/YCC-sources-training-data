<?php
declare(strict_types=1);

function binaryGap(int $n): int
{
    $trimmed = rtrim(decbin($n), '0');
    return max(0, ...array_map('strlen', explode('1', $trimmed)));
}

foreach ([9, 529, 20, 15, 1041] as $n) echo $n, ' ', decbin($n), ' ', binaryGap($n), PHP_EOL;
