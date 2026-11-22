<?php
// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
function is_practical(int $n): bool {
    $reach = 1; // bit i set <=> i is a subset sum
    for ($d = 1; $d <= $n; $d++) if ($n % $d === 0) $reach |= $reach << $d;
    $mask = (1 << ($n + 1)) - 1;
    return ($reach & $mask) === $mask;
}
$out = array_filter(range(1, 40), 'is_practical');
echo implode(" ", $out), "\n";
