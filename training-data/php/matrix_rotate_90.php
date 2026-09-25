<?php
declare(strict_types=1);

function rotateClockwise(array $m): array
{
    return array_map(fn($row) => array_reverse($row), array_map(null, ...$m));
}

foreach (rotateClockwise([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) as $row) {
    echo implode(' ', $row), PHP_EOL;
}
