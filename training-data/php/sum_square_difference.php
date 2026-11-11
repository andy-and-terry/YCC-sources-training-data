<?php
// Square of the sum minus sum of squares for 1..10 (expect 2640)
$xs = range(1, 10);
$sum = array_sum($xs);
$squares = array_sum(array_map(fn($x) => $x * $x, $xs));
echo $sum * $sum - $squares, "\n";
