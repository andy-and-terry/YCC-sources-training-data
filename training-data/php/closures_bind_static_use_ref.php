<?php
$total = 0;
$add = function (int $n) use (&$total) { $total += $n; };
array_map($add, [1, 2, 3]);
echo $total, "\n";
$mul = fn($x) => $x * $total;
echo $mul(2), "\n";
