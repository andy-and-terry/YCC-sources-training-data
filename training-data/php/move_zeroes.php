<?php

function moveZeroes(array $a): array
{
    $w = 0;
    foreach ($a as $x) {
        if ($x !== 0) {
            $a[$w++] = $x;
        }
    }
    for (; $w < count($a); $w++) {
        $a[$w] = 0;
    }
    return $a;
}

echo implode(' ', moveZeroes([0, 1, 0, 3, 12, 0, 7])), PHP_EOL;
// functional alternative (stable)
$a = [0, 1, 0, 3, 12];
$nonZero = array_values(array_filter($a));
echo implode(' ', array_pad($nonZero, count($a), 0)), PHP_EOL;
