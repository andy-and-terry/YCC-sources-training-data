<?php
function chebyshev(array $a, array $b): int {
    return max(array_map(fn($x, $y) => abs($x - $y), $a, $b));
}

echo chebyshev([1, 2], [4, 6]), "\n";
