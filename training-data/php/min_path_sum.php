<?php

function minPathSum(array $g): array
{
    $rows = count($g);
    $cols = count($g[0]);
    $dp = [];
    for ($r = 0; $r < $rows; $r++) {
        for ($c = 0; $c < $cols; $c++) {
            $prev = min($r > 0 ? $dp[$r - 1][$c] : PHP_INT_MAX, $c > 0 ? $dp[$r][$c - 1] : PHP_INT_MAX);
            $dp[$r][$c] = $g[$r][$c] + ($r === 0 && $c === 0 ? 0 : $prev);
        }
    }
    [$r, $c] = [$rows - 1, $cols - 1];
    $path = ["($r,$c)"];
    while ($r > 0 || $c > 0) {
        if ($r === 0 || ($c > 0 && $dp[$r][$c - 1] < $dp[$r - 1][$c])) {
            $c--;
        } else {
            $r--;
        }
        array_unshift($path, "($r,$c)");
    }
    return [$dp[$rows - 1][$cols - 1], $path];
}

[$cost, $path] = minPathSum([[1, 3, 1], [1, 5, 1], [4, 2, 1]]);
echo "cost $cost path ", implode(' ', $path), PHP_EOL;
