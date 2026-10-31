<?php
function persistence(int $n): int {
    $steps = 0;
    while ($n >= 10) {
        $n = array_product(str_split((string) $n));
        $steps++;
    }
    return $steps;
}

foreach ([39, 77, 999, 10] as $n) {
    echo $n, " ", persistence($n), "\n";
}
