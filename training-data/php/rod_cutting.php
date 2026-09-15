<?php

function rodCutting(array $prices, int $length): int
{
    $dp = array_fill(0, $length + 1, 0);
    for ($i = 1; $i <= $length; $i++) {
        for ($cut = 1; $cut <= $i; $cut++) {
            $dp[$i] = max($dp[$i], $prices[$cut] + $dp[$i - $cut]);
        }
    }
    return $dp[$length];
}

$prices = [0 => 0, 1 => 1, 2 => 5, 3 => 8, 4 => 9, 5 => 10, 6 => 17, 7 => 17, 8 => 20];
echo rodCutting($prices, 8) . "\n";
echo rodCutting($prices, 4) . "\n";
