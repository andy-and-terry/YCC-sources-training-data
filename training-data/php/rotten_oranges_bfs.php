<?php

function orangesRotting(array $grid): int
{
    $q = new SplQueue();
    $fresh = 0;
    foreach ($grid as $r => $row) {
        foreach ($row as $c => $v) {
            if ($v === 2) {
                $q->enqueue([$r, $c, 0]);
            } elseif ($v === 1) {
                $fresh++;
            }
        }
    }
    $minutes = 0;
    while (!$q->isEmpty()) {
        [$r, $c, $t] = $q->dequeue();
        $minutes = max($minutes, $t);
        foreach ([[1, 0], [-1, 0], [0, 1], [0, -1]] as [$dr, $dc]) {
            [$nr, $nc] = [$r + $dr, $c + $dc];
            if (($grid[$nr][$nc] ?? 0) === 1) {
                $grid[$nr][$nc] = 2;
                $fresh--;
                $q->enqueue([$nr, $nc, $t + 1]);
            }
        }
    }
    return $fresh === 0 ? $minutes : -1;
}

echo orangesRotting([[2, 1, 1], [1, 1, 0], [0, 1, 1]]), ' ';
echo orangesRotting([[2, 1, 1], [0, 1, 1], [1, 0, 1]]), ' ';
echo orangesRotting([[0, 2]]), PHP_EOL;
