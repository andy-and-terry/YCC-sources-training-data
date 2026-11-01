<?php
// Positive n expressible as a*a + b*b with a, b >= 0.
function representable(int $n): bool {
    for ($a = 0; $a * $a <= $n; $a++) {
        $b = (int) round(sqrt($n - $a * $a));
        if ($a * $a + $b * $b === $n) return true;
    }
    return false;
}

echo implode(" ", array_filter(range(1, 30), 'representable')), "\n";
