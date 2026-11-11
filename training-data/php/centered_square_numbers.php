<?php
// Centered square numbers 2n(n+1)+1
function term(int $n): int {
    return ((2 * $n) * ($n + 1)) + 1;
}

echo implode(' ', array_map('term', range(0, 9))), "\n";
