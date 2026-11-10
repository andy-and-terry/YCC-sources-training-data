<?php
function centralDelannoy(int $n): int {
    $g = [];
    for ($i = 0; $i <= $n; $i++) {
        for ($j = 0; $j <= $n; $j++) {
            $g[$i][$j] = ($i === 0 || $j === 0) ? 1 : $g[$i - 1][$j] + $g[$i][$j - 1] + $g[$i - 1][$j - 1];
        }
    }
    return $g[$n][$n];
}
echo implode(" ", array_map('centralDelannoy', range(0, 5))), "\n"; // 1 3 13 63 321 1683
