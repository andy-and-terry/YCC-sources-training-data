<?php
function gcd(int $a, int $b): int {
    return $b === 0 ? abs($a) : gcd($b, $a % $b);
}

function gcdAll(int ...$nums): int {
    return array_reduce($nums, 'gcd', 0);
}

echo gcdAll(12, 18, 24), "\n";
echo gcdAll(7, 13), "\n";
