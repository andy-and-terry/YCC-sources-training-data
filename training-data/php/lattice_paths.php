<?php
// Lattice paths using a DP row.
function lattice(int $n): int {
    $row = array_fill(0, $n + 1, 1);
    for ($i = 0; $i < $n; $i++) for ($j = 1; $j <= $n; $j++) $row[$j] += $row[$j - 1];
    return $row[$n];
}
echo lattice(3), "\n";
