<?php

function rotateClockwise(array $m): array
{
    return array_map('array_reverse', array_map(null, ...$m));
}

function rotateCounter(array $m): array
{
    return array_reverse(array_map(null, ...$m));
}

$m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
foreach (rotateClockwise($m) as $row) {
    echo implode(' ', $row), PHP_EOL;
}
echo json_encode(rotateCounter($m)), PHP_EOL;
