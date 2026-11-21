<?php
// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
function isKeith(int $n): bool {
    $seq = array_map('intval', str_split((string)$n));
    $k = count($seq);
    while (end($seq) < $n) {
        $seq[] = array_sum(array_slice($seq, -$k));
    }
    return end($seq) === $n;
}

$out = [];
for ($n = 10; $n < 1200; $n++) {
    if (isKeith($n)) $out[] = $n;
}
echo implode(" ", $out), "\n";
