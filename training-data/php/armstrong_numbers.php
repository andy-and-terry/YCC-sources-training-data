<?php
function isArmstrong(int $n): bool {
    $digits = str_split((string)$n);
    $len = count($digits);
    return array_sum(array_map(fn($d) => $d ** $len, $digits)) === $n;
}

$result = array_filter(range(1, 999), 'isArmstrong');
echo implode(" ", $result), "\n"; // 1..9 153 370 371 407
