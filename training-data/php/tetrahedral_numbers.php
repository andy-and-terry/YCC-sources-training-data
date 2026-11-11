<?php
// Tetrahedral numbers n(n+1)(n+2)/6
function term(int $n): int {
    return intdiv((($n * ($n + 1)) * ($n + 2)), 6);
}

echo implode(' ', array_map('term', range(0, 9))), "\n";
