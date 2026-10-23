<?php
declare(strict_types=1);

function ulam(int $count): array
{
    $seq = [1, 2];
    for ($candidate = 3; count($seq) < $count; $candidate++) {
        $ways = 0;
        $size = count($seq);
        for ($i = 0; $i < $size; $i++) {
            for ($j = $i + 1; $j < $size; $j++) {
                if ($seq[$i] + $seq[$j] === $candidate) {
                    $ways++;
                }
            }
        }
        if ($ways === 1) {
            $seq[] = $candidate;
        }
    }
    return $seq;
}

echo implode(' ', ulam(15)), PHP_EOL;
