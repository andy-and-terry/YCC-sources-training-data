<?php
// Amicable pairs below 1500 via sums of proper divisors.
function s(int $n): int {
    $t = 0;
    for ($d = 1; $d < $n; $d++) {
        if ($n % $d === 0) $t += $d;
    }
    return $t;
}

for ($a = 2; $a < 1500; $a++) {
    $b = s($a);
    if ($b > $a && s($b) === $a) echo "$a $b\n";
}
