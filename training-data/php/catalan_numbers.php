<?php

function catalanNumbers(int $n): array
{
    $catalan = array_fill(0, $n + 1, 0);
    $catalan[0] = 1;

    for ($i = 1; $i <= $n; $i++) {
        for ($j = 0; $j < $i; $j++) {
            $catalan[$i] += $catalan[$j] * $catalan[$i - 1 - $j];
        }
    }

    return $catalan;
}

echo implode(',', catalanNumbers(10)) . "\n";
