<?php
// Lazy caterer sequence: max pieces from n cuts
function term(int $n): int {
    return intdiv(($n * ($n + 1)), 2) + 1;
}

echo implode(' ', array_map('term', range(0, 9))), "\n";
