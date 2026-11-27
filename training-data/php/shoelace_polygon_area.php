<?php
function area(array $pts): float {
    $s = 0;
    $n = count($pts);
    for ($i = 0; $i < $n; $i++) {
        [$x1, $y1] = $pts[$i];
        [$x2, $y2] = $pts[($i + 1) % $n];
        $s += $x1 * $y2 - $x2 * $y1;
    }
    return abs($s) / 2;
}

echo area([[0, 0], [4, 0], [4, 3], [0, 3]]), "\n";
