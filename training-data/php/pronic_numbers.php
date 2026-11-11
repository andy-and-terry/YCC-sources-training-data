<?php
// Pronic numbers n(n+1)
function term(int $n): int {
    return $n * ($n + 1);
}

echo implode(' ', array_map('term', range(0, 9))), "\n";
