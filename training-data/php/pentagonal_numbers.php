<?php
// Pentagonal numbers: n(3n-1)/2.
echo implode(" ", array_map(fn($n) => intdiv($n * (3 * $n - 1), 2), range(1, 10))), "\n";
