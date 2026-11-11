<?php
// Amicable pairs: d(a) == b and d(b) == a with a != b.
function d(int $n): int {
    $s = 0;
    for ($i = 1; $i < $n; $i++) {
        if ($n % $i === 0) $s += $i;
    }
    return $s;
}

for ($a = 2; $a < 1500; $a++) {
    $b = d($a);
    if ($b > $a && d($b) === $a) echo "$a $b\n";
}
