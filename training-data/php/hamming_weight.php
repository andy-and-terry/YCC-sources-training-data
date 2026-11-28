<?php
function popcount(int $n): int {
    $c = 0;
    while ($n) {
        $n &= $n - 1;
        $c++;
    }
    return $c;
}

echo popcount(0b10110111), " ", substr_count(decbin(0b10110111), '1'), "\n";
