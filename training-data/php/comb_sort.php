<?php

function combSort(array $a): array
{
    $gap = count($a);
    $sorted = false;
    while (!$sorted) {
        $gap = (int) ($gap / 1.3);
        if ($gap <= 1) {
            $gap = 1;
            $sorted = true;
        }
        for ($i = 0; $i + $gap < count($a); $i++) {
            if ($a[$i] > $a[$i + $gap]) {
                [$a[$i], $a[$i + $gap]] = [$a[$i + $gap], $a[$i]];
                $sorted = false;
            }
        }
    }
    return $a;
}

echo implode(' ', combSort([8, 4, 1, 56, 3, -44, 23, -6, 28, 0])), PHP_EOL;
