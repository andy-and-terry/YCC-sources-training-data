<?php

function oddEvenSort(array $a): array
{
    $n = count($a);
    $sorted = false;
    while (!$sorted) {
        $sorted = true;
        foreach ([1, 0] as $start) {
            for ($i = $start; $i < $n - 1; $i += 2) {
                if ($a[$i] > $a[$i + 1]) {
                    [$a[$i], $a[$i + 1]] = [$a[$i + 1], $a[$i]];
                    $sorted = false;
                }
            }
        }
    }
    return $a;
}

echo implode(' ', oddEvenSort([34, 2, 10, -9, 7, 7, 0, 15])), PHP_EOL;
