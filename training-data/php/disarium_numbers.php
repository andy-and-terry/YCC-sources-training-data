<?php
// Disarium numbers: digits raised to their 1-based positions sum to n.
function isDisarium(int $n): bool {
    $sum = 0;
    foreach (str_split((string)$n) as $i => $c) {
        $sum += ((int)$c) ** ($i + 1);
    }
    return $sum === $n;
}

$out = [];
for ($n = 1; $n < 1000; $n++) {
    if (isDisarium($n)) $out[] = $n;
}
echo implode(" ", $out), "\n";
