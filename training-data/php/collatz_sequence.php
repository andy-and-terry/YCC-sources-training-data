<?php

function collatz(int $n): Generator
{
    yield $n;
    while ($n !== 1) {
        $n = $n % 2 === 0 ? intdiv($n, 2) : 3 * $n + 1;
        yield $n;
    }
}

$seq = iterator_to_array(collatz(27), false);
echo implode(' ', array_slice($seq, 0, 10)), ' ... length ', count($seq), PHP_EOL;

$cache = [1 => 0];
$steps = function (int $n) use (&$cache): int {
    $path = [];
    while (!isset($cache[$n])) {
        $path[] = $n;
        $n = $n % 2 === 0 ? intdiv($n, 2) : 3 * $n + 1;
    }
    $s = $cache[$n];
    foreach (array_reverse($path) as $x) {
        $cache[$x] = ++$s;
    }
    return $s;
};
$best = 1;
for ($i = 1; $i < 100000; $i++) {
    if ($steps($i) > $cache[$best]) {
        $best = $i;
    }
}
echo "longest under 100000: $best ({$cache[$best]} steps)", PHP_EOL;
