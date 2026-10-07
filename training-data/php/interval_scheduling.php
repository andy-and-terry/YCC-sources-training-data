<?php

/** @param list<array{int,int}> $intervals */
function maxNonOverlapping(array $intervals): array
{
    usort($intervals, fn ($a, $b) => $a[1] <=> $b[1]);
    $end = PHP_INT_MIN;
    $chosen = [];
    foreach ($intervals as [$s, $e]) {
        if ($s >= $end) {
            $chosen[] = [$s, $e];
            $end = $e;
        }
    }
    return $chosen;
}

function minRooms(array $intervals): int
{
    $events = [];
    foreach ($intervals as [$s, $e]) {
        $events[] = [$s, 1];
        $events[] = [$e, -1];
    }
    usort($events, fn ($a, $b) => $a <=> $b);
    [$cur, $best] = [0, 0];
    foreach ($events as [, $d]) {
        $best = max($best, $cur += $d);
    }
    return $best;
}

$m = [[1, 4], [3, 5], [0, 6], [5, 7], [3, 9], [5, 9], [6, 10], [8, 11], [8, 12], [2, 14], [12, 16]];
echo json_encode(maxNonOverlapping($m)), ' rooms: ', minRooms($m), PHP_EOL;
