<?php
function accumulator(): Generator {
    $total = 0;
    while (true) {
        $x = yield $total;
        if ($x === null) return $total;
        $total += $x;
    }
}
$g = accumulator();
$g->current();
foreach ([5, 10, 20] as $n) {
    echo $g->send($n), "\n";
}
