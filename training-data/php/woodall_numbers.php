<?php
declare(strict_types=1);

function woodall(int $n): int
{
    return $n * (1 << $n) - 1;
}

echo implode(' ', array_map('woodall', range(1, 10))), PHP_EOL;
