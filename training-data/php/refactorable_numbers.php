<?php
function tau(int $n): int {
    return count(array_filter(range(1, $n), fn($d) => $n % $d === 0));
}
echo implode(" ", array_filter(range(1, 59), fn($n) => $n % tau($n) === 0)), "\n"; // 1 2 8 9 12 18 24 36 40 56
