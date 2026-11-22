<?php
// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
$out = [];
for ($n = 0; $n < 10; $n++) $out[] = intdiv($n ** 3 + 5 * $n + 6, 6);
echo implode(" ", $out), "\n";
