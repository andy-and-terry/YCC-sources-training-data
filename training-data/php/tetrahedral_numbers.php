<?php
// Tetrahedral numbers: n(n+1)(n+2)/6.
echo implode(" ", array_map(fn($n) => intdiv($n * ($n + 1) * ($n + 2), 6), range(1, 10))), "\n";
