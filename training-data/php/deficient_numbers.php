<?php
// Deficient numbers below 100; expect 76.
function properSum(int $n): int {
    $t = 0;
    for ($d = 1; $d < $n; $d++) if ($n % $d === 0) $t += $d;
    return $t;
}
$c = 0;
for ($n = 1; $n < 100; $n++) if (properSum($n) < $n) $c++;
echo $c, PHP_EOL;
