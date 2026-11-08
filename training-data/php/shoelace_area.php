<?php
function shoelace(array $p): float {
    $n = count($p);
    $s = 0;
    for ($i = 0; $i < $n; $i++) {
        [$x1, $y1] = $p[$i];
        [$x2, $y2] = $p[($i + 1) % $n];
        $s += $x1 * $y2 - $x2 * $y1;
    }
    return abs($s) / 2;
}

echo shoelace([[0, 0], [4, 0], [4, 3], [0, 3]]), "\n";
