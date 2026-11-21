<?php
// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
function isCyclops(int $n): bool {
    $s = (string)$n;
    $len = strlen($s);
    return $len % 2 === 1 && $s[intdiv($len, 2)] === '0' && substr_count($s, '0') === 1;
}

$count = 0;
for ($n = 1; $n < 100000; $n++) {
    if (isCyclops($n)) $count++;
}
echo $count, "\n";
