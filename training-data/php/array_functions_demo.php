<?php

$numbers = range(1, 10);

$evenSquares = array_map(
    fn ($n) => $n * $n,
    array_filter($numbers, fn ($n) => $n % 2 === 0)
);
print_r(array_values($evenSquares));

$sum = array_reduce($numbers, fn ($carry, $n) => $carry + $n, 0);
echo "sum: $sum\n";
