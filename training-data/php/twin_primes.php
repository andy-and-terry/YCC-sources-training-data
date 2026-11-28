<?php
$n = 50;
$composite = array_fill(0, $n + 1, false);
for ($i = 2; $i * $i <= $n; $i++)
    if (!$composite[$i])
        for ($j = $i * $i; $j <= $n; $j += $i) $composite[$j] = true;
for ($p = 3; $p + 2 <= $n; $p++)
    if (!$composite[$p] && !$composite[$p + 2]) echo "($p, ", $p + 2, ") ";
echo "\n";
