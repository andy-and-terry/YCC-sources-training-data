<?php

function uniquePaths(int $m, int $n): int
{
    $row = array_fill(0, $n, 1);
    for ($r = 1; $r < $m; $r++) {
        for ($c = 1; $c < $n; $c++) {
            $row[$c] += $row[$c - 1];
        }
    }
    return $row[$n - 1];
}

function uniquePathsWithObstacles(array $grid): int
{
    $n = count($grid[0]);
    $row = array_fill(0, $n, 0);
    $row[0] = 1;
    foreach ($grid as $cells) {
        foreach ($cells as $c => $blocked) {
            if ($blocked) {
                $row[$c] = 0;
            } elseif ($c > 0) {
                $row[$c] += $row[$c - 1];
            }
        }
    }
    return $row[$n - 1];
}

echo uniquePaths(3, 7), ' ', uniquePaths(10, 10), PHP_EOL;
echo uniquePathsWithObstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]]), PHP_EOL;
