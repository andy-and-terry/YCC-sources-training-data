<?php

function flip(array &$a, int $k): void
{
    for ($i = 0, $j = $k; $i < $j; $i++, $j--) {
        [$a[$i], $a[$j]] = [$a[$j], $a[$i]];
    }
}

function pancakeSort(array $a): array
{
    $flips = [];
    for ($size = count($a); $size > 1; $size--) {
        $maxIdx = array_search(max(array_slice($a, 0, $size)), array_slice($a, 0, $size), true);
        if ($maxIdx === $size - 1) {
            continue;
        }
        if ($maxIdx > 0) {
            flip($a, $maxIdx);
            $flips[] = $maxIdx + 1;
        }
        flip($a, $size - 1);
        $flips[] = $size;
    }
    return [$a, $flips];
}

[$sorted, $flips] = pancakeSort([3, 6, 1, 9, 4, 2]);
echo implode(' ', $sorted), ' | flips: ', implode(',', $flips), PHP_EOL;
