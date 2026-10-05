<?php

function collatz(int $n): Generator
{
    yield $n;
    while ($n !== 1) {
        $n = $n % 2 === 0 ? intdiv($n, 2) : 3 * $n + 1;
        yield $n;
    }
}

echo implode(' -> ', iterator_to_array(collatz(6), false)), "\n";

$best = 1;
$bestLen = 0;
for ($i = 1; $i <= 1000; $i++) {
    $len = iterator_count(collatz($i));
    if ($len > $bestLen) {
        [$best, $bestLen] = [$i, $len];
    }
}
echo "longest under 1000: $best ($bestLen terms)\n";
