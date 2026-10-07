<?php

function cocktailShakerSort(array $a): array
{
    $lo = 0;
    $hi = count($a) - 1;
    $swapped = true;
    while ($swapped) {
        $swapped = false;
        for ($i = $lo; $i < $hi; $i++) {
            if ($a[$i] > $a[$i + 1]) {
                [$a[$i], $a[$i + 1]] = [$a[$i + 1], $a[$i]];
                $swapped = true;
            }
        }
        $hi--;
        for ($i = $hi; $i > $lo; $i--) {
            if ($a[$i - 1] > $a[$i]) {
                [$a[$i - 1], $a[$i]] = [$a[$i], $a[$i - 1]];
                $swapped = true;
            }
        }
        $lo++;
    }
    return $a;
}

echo implode(' ', cocktailShakerSort([5, 1, 4, 2, 8, 0, 2])), PHP_EOL;
echo implode(' ', cocktailShakerSort(['pear', 'apple', 'fig'])), PHP_EOL;
