<?php

function islandPerimeter(array $g): int
{
    $at = fn ($r, $c) => $g[$r][$c] ?? 0;
    $per = 0;
    foreach ($g as $r => $row) {
        foreach ($row as $c => $v) {
            if ($v === 1) {
                $per += 4 - $at($r - 1, $c) - $at($r + 1, $c) - $at($r, $c - 1) - $at($r, $c + 1);
            }
        }
    }
    return $per;
}

echo islandPerimeter([[0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0]]), PHP_EOL;
