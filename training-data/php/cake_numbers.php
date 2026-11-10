<?php
function cake(int $n): int {
    return intdiv($n ** 3 + 5 * $n + 6, 6);
}
echo implode(" ", array_map('cake', range(0, 9))), "\n"; // 1 2 4 8 15 26 42 64 93 130
