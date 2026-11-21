<?php
// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
function isMunchausen(int $n): bool {
    $sum = 0;
    foreach (str_split((string)$n) as $c) {
        $d = (int)$c;
        $sum += $d === 0 ? 0 : $d ** $d;
    }
    return $sum === $n;
}

$out = [];
for ($n = 1; $n < 5000; $n++) {
    if (isMunchausen($n)) $out[] = $n;
}
echo implode(" ", $out), "\n";
