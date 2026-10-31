<?php
$fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];

function isFactorion(int $n, array $fact): bool {
    return $n === array_sum(array_map(fn($d) => $fact[(int) $d], str_split((string) $n)));
}

$found = array_filter(range(1, 49999), fn($n) => isFactorion($n, $fact));
echo implode(" ", $found), "\n";
