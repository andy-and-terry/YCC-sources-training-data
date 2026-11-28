<?php
function lisLength(array $a): int {
    $tails = [];
    foreach ($a as $x) {
        $lo = 0; $hi = count($tails);
        while ($lo < $hi) {
            $mid = intdiv($lo + $hi, 2);
            if ($tails[$mid] < $x) $lo = $mid + 1; else $hi = $mid;
        }
        $tails[$lo] = $x;
    }
    return count($tails);
}
echo lisLength([10, 9, 2, 5, 3, 7, 101, 18]), "\n";
