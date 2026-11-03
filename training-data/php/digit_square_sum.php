<?php
function digitSquareSum(int $n): int {
    return array_sum(array_map(fn($d) => $d * $d, str_split((string) abs($n))));
}

echo digitSquareSum(123), PHP_EOL;
echo digitSquareSum(-99), PHP_EOL;
