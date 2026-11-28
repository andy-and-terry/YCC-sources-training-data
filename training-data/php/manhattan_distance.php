<?php
function manhattan(array $a, array $b): int {
    return array_sum(array_map(fn($x, $y) => abs($x - $y), $a, $b));
}

echo manhattan([1, 2], [4, 6]), "\n";
