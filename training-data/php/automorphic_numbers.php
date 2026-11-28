<?php
function isAutomorphic(int $n): bool {
    return str_ends_with((string)($n * $n), (string)$n);
}

echo implode(" ", array_filter(range(0, 999), 'isAutomorphic')), "\n";
// 0 1 5 6 25 76 376 625
