<?php
// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
function isHamming(int $n): bool {
    foreach ([2, 3, 5] as $p) {
        while ($n % $p === 0) {
            $n = intdiv($n, $p);
        }
    }
    return $n === 1;
}

$found = [];
for ($n = 1; count($found) < 20; $n++) {
    if (isHamming($n)) {
        $found[] = $n;
    }
}
echo implode(" ", $found), "\n";
