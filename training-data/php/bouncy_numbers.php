<?php
// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function isBouncy(int $n): bool {
    $d = str_split((string)$n);
    $up = $d;
    sort($up);
    $down = array_reverse($up);
    return $d !== $up && $d !== $down;
}

$count = 0;
for ($n = 1; $n < 1000; $n++) {
    if (isBouncy($n)) $count++;
}
echo $count, "\n";
