<?php
// Centered square numbers: n^2 + (n+1)^2.
echo implode(" ", array_map(fn($n) => $n ** 2 + ($n + 1) ** 2, range(0, 9))), "\n";
