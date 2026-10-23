<?php
declare(strict_types=1);

function zeckendorf(int $n): array
{
    $fibs = [1, 2];
    while (end($fibs) <= $n) {
        $fibs[] = $fibs[count($fibs) - 1] + $fibs[count($fibs) - 2];
    }
    $parts = [];
    foreach (array_reverse($fibs) as $f) {
        if ($f <= $n) {
            $parts[] = $f;
            $n -= $f;
        }
    }
    return $parts;
}

echo implode(' ', zeckendorf(100)), PHP_EOL;
