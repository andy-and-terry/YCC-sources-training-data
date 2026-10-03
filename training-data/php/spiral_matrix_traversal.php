<?php

function spiralOrder(array $matrix): array
{
    $result = [];
    if ($matrix === []) {
        return $result;
    }
    $top = 0;
    $bottom = count($matrix) - 1;
    $left = 0;
    $right = count($matrix[0]) - 1;
    while ($top <= $bottom && $left <= $right) {
        for ($c = $left; $c <= $right; $c++) {
            $result[] = $matrix[$top][$c];
        }
        $top++;
        for ($r = $top; $r <= $bottom; $r++) {
            $result[] = $matrix[$r][$right];
        }
        $right--;
        if ($top <= $bottom) {
            for ($c = $right; $c >= $left; $c--) {
                $result[] = $matrix[$bottom][$c];
            }
            $bottom--;
        }
        if ($left <= $right) {
            for ($r = $bottom; $r >= $top; $r--) {
                $result[] = $matrix[$r][$left];
            }
            $left++;
        }
    }
    return $result;
}

$matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
echo implode(' ', spiralOrder($matrix)) . "\n";
