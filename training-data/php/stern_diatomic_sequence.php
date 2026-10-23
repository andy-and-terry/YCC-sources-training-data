<?php
declare(strict_types=1);

function stern(int $count): array
{
    $s = [0, 1];
    for ($n = 2; $n < $count; $n++) {
        $s[$n] = $n % 2 === 0
            ? $s[intdiv($n, 2)]
            : $s[intdiv($n - 1, 2)] + $s[intdiv($n + 1, 2)];
    }
    return array_slice($s, 0, $count);
}

echo implode(' ', stern(20)), PHP_EOL;
