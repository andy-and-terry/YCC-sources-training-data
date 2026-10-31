<?php
function cubeFromOdds(int $n): int {
    $start = $n * $n - $n + 1;
    $sum = 0;
    for ($i = 0; $i < $n; $i++) $sum += $start + 2 * $i;
    return $sum;
}

for ($n = 1; $n <= 5; $n++) {
    echo $n, " ", cubeFromOdds($n), " ", cubeFromOdds($n) === $n ** 3 ? "true" : "false", "\n";
}
