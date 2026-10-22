<?php
declare(strict_types=1);

function golomb(int $count): array
{
    $g = [1 => 1];
    for ($n = 2; $n <= $count; $n++) {
        $g[$n] = 1 + $g[$n - $g[$g[$n - 1]]];
    }
    return $g;
}

echo implode(' ', golomb(20)), PHP_EOL;
