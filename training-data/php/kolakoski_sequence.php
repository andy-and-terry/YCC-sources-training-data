<?php
declare(strict_types=1);

function kolakoski(int $count): array
{
    $seq = [1, 2, 2];
    for ($i = 2; count($seq) < $count; $i++) {
        $value = $i % 2 === 0 ? 1 : 2;
        for ($k = 0; $k < $seq[$i]; $k++) {
            $seq[] = $value;
        }
    }
    return array_slice($seq, 0, $count);
}

echo implode(' ', kolakoski(20)), PHP_EOL;
