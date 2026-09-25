<?php

function binaryInsertionSort(array $items): array
{
    $out = [];
    foreach ($items as $x) {
        $lo = 0;
        $hi = count($out);
        while ($lo < $hi) {
            $mid = intdiv($lo + $hi, 2);
            if ($out[$mid] <= $x) {
                $lo = $mid + 1;
            } else {
                $hi = $mid;
            }
        }
        array_splice($out, $lo, 0, [$x]);
    }
    return $out;
}

echo implode(' ', binaryInsertionSort([37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54])), PHP_EOL;
