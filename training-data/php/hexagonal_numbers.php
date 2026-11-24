<?php
// Hexagonal numbers: n(2n-1).
echo implode(" ", array_map(fn($n) => $n * (2 * $n - 1), range(1, 10))), "\n";
