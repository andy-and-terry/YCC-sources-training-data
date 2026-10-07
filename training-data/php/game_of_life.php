<?php

function step(array $live): array
{
    $counts = [];
    foreach (array_keys($live) as $key) {
        [$x, $y] = array_map('intval', explode(',', $key));
        for ($dx = -1; $dx <= 1; $dx++) {
            for ($dy = -1; $dy <= 1; $dy++) {
                if ($dx || $dy) {
                    $k = ($x + $dx) . ',' . ($y + $dy);
                    $counts[$k] = ($counts[$k] ?? 0) + 1;
                }
            }
        }
    }
    $next = [];
    foreach ($counts as $k => $n) {
        if ($n === 3 || ($n === 2 && isset($live[$k]))) {
            $next[$k] = true;
        }
    }
    return $next;
}

$live = array_fill_keys(['1,0', '2,1', '0,2', '1,2', '2,2'], true);
for ($gen = 0; $gen < 4; $gen++) {
    echo "gen $gen", PHP_EOL;
    for ($y = 0; $y < 6; $y++) {
        for ($x = 0; $x < 6; $x++) {
            echo isset($live["$x,$y"]) ? '#' : '.';
        }
        echo PHP_EOL;
    }
    $live = step($live);
}
