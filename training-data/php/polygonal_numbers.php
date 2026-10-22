<?php
declare(strict_types=1);

function polygonal(int $sides, int $n): int
{
    return intdiv(($sides - 2) * $n * $n - ($sides - 4) * $n, 2);
}

foreach (['Triangular' => 3, 'Pentagonal' => 5, 'Hexagonal' => 6] as $name => $sides) {
    $nums = array_map(fn($n) => polygonal($sides, $n), range(1, 10));
    echo $name, ': ', implode(' ', $nums), PHP_EOL;
}
