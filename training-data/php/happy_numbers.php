<?php
function isHappy(int $n): bool {
    $seen = [];
    while ($n !== 1 && !isset($seen[$n])) {
        $seen[$n] = true;
        $n = array_sum(array_map(fn($d) => $d * $d, str_split((string)$n)));
    }
    return $n === 1;
}

$found = [];
for ($n = 1; count($found) < 8; $n++) {
    if (isHappy($n)) $found[] = $n;
}
echo implode(" ", $found), "\n"; // 1 7 10 13 19 23 28 31
