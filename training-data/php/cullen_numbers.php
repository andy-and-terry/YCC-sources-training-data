<?php
declare(strict_types=1);

function cullen(int $n): int
{
    return $n * (1 << $n) + 1;
}

echo implode(' ', array_map('cullen', range(0, 9))), PHP_EOL;
