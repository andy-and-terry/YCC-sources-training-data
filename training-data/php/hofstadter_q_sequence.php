<?php
declare(strict_types=1);

function hofstadterQ(int $count): array
{
    $q = [1 => 1, 2 => 1];
    for ($n = 3; $n <= $count; $n++) {
        $q[$n] = $q[$n - $q[$n - 1]] + $q[$n - $q[$n - 2]];
    }
    return $q;
}

echo implode(' ', hofstadterQ(20)), PHP_EOL;
