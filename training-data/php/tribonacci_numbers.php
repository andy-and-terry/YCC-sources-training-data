<?php
// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
function tribonacci(int $count): array {
    $t = [0, 0, 1];
    while (count($t) < $count) {
        $n = count($t);
        $t[] = $t[$n - 1] + $t[$n - 2] + $t[$n - 3];
    }
    return array_slice($t, 0, $count);
}

echo "Tribonacci: " . implode(", ", tribonacci(15)) . "\n";
