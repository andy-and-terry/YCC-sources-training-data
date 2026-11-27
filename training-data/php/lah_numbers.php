<?php
function lah(int $n, int $k): int {
    $c = 1;
    for ($i = 0; $i < $k - 1; $i++) $c = intdiv($c * ($n - 1 - $i), $i + 1);
    $f = 1;
    for ($i = $k + 1; $i <= $n; $i++) $f *= $i;
    return $c * $f;
}

for ($n = 1; $n <= 5; $n++) {
    $row = [];
    for ($k = 1; $k <= $n; $k++) $row[] = lah($n, $k);
    echo implode(' ', $row), "\n";
}
