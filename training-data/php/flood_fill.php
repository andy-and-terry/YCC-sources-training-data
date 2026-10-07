<?php

function floodFill(array &$grid, int $r, int $c, string $color): int
{
    $target = $grid[$r][$c];
    if ($target === $color) {
        return 0;
    }
    $queue = new SplQueue();
    $queue->enqueue([$r, $c]);
    $grid[$r][$c] = $color;
    $filled = 1;
    while (!$queue->isEmpty()) {
        [$y, $x] = $queue->dequeue();
        foreach ([[1, 0], [-1, 0], [0, 1], [0, -1]] as [$dy, $dx]) {
            [$ny, $nx] = [$y + $dy, $x + $dx];
            if (($grid[$ny][$nx] ?? null) === $target) {
                $grid[$ny][$nx] = $color;
                $filled++;
                $queue->enqueue([$ny, $nx]);
            }
        }
    }
    return $filled;
}

$img = array_map('str_split', ['..####..', '.#....#.', '.#....#.', '..####..']);
echo 'filled ', floodFill($img, 1, 3, 'o'), PHP_EOL;
foreach ($img as $row) {
    echo implode('', $row), PHP_EOL;
}
