<?php

function knightPath(string $from, string $to): array
{
    $sq = fn (string $s) => [ord($s[0]) - 97, (int) $s[1] - 1];
    $name = fn (array $p) => chr(97 + $p[0]) . ($p[1] + 1);
    [$start, $goal] = [$sq($from), $sq($to)];
    $prev = [implode(',', $start) => null];
    $queue = new SplQueue();
    $queue->enqueue($start);
    while (!$queue->isEmpty() && !array_key_exists(implode(',', $goal), $prev)) {
        $cur = $queue->dequeue();
        foreach ([[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]] as [$dx, $dy]) {
            $n = [$cur[0] + $dx, $cur[1] + $dy];
            $key = implode(',', $n);
            if ($n[0] < 0 || $n[0] > 7 || $n[1] < 0 || $n[1] > 7 || array_key_exists($key, $prev)) {
                continue;
            }
            $prev[$key] = $cur;
            $queue->enqueue($n);
        }
    }
    $path = [];
    for ($p = $goal; $p !== null; $p = $prev[implode(',', $p)]) {
        array_unshift($path, $name($p));
    }
    return $path;
}

foreach ([['a1', 'h8'], ['a1', 'b2'], ['d4', 'd5']] as [$a, $b]) {
    $p = knightPath($a, $b);
    printf("%s->%s (%d moves): %s\n", $a, $b, count($p) - 1, implode(' ', $p));
}
