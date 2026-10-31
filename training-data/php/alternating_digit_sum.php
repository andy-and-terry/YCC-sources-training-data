<?php
function alternatingDigitSum(int $n): int {
    $total = 0;
    $sign = 1;
    while ($n > 0) {
        $total += $sign * ($n % 10);
        $sign = -$sign;
        $n = intdiv($n, 10);
    }
    return $total;
}

foreach ([1234, 99999, 1000] as $n) {
    echo $n, " ", alternatingDigitSum($n), "\n";
}
