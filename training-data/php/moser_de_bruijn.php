<?php
// Reinterpret binary digits of $i as base-4 digits.
function moserDeBruijn(int $i): int {
    return intval(decbin($i), 4);
}
echo implode(" ", array_map('moserDeBruijn', range(0, 9))), "\n"; // 0 1 4 5 16 17 20 21 64 65
