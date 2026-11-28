<?php
function isPronic(int $x): bool {
    $n = (int)floor(sqrt($x));
    return $n * ($n + 1) === $x;
}

echo implode(" ", array_map(fn($n) => $n * ($n + 1), range(0, 9))), "\n"; // 0 2 6 12 20 30 42 56 72 90
var_dump(isPronic(56), isPronic(57)); // bool(true) bool(false)
