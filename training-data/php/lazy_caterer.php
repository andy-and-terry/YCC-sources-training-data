<?php
$pieces = fn(int $cuts): int => intdiv($cuts * $cuts + $cuts + 2, 2);
echo implode(" ", array_map($pieces, range(0, 9))), "\n"; // 1 2 4 7 11 16 22 29 37 46
