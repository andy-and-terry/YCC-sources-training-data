<?php
function sigma(int $n): int {
    return array_sum(array_filter(range(1, $n), fn($d) => $n % $d === 0));
}
echo implode(" ", array_filter(range(1, 99), fn($n) => sigma(sigma($n)) === 2 * $n)), "\n"; // 2 4 16 64
