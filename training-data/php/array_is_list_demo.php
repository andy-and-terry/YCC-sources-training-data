<?php

declare(strict_types=1);

// array_is_list (PHP 8.1) is true only for keys 0..n-1 in order
$samples = [
    'sequential'    => [10, 20, 30],
    'empty'         => [],
    'string keys'   => ['a' => 1, 'b' => 2],
    'gap in keys'   => [0 => 'x', 2 => 'y'],
    'reordered'     => [1 => 'b', 0 => 'a'],
];

foreach ($samples as $label => $arr) {
    printf("%-12s %s\n", $label, array_is_list($arr) ? 'list' : 'map');
}

// Typical use: choose a JSON shape, or reindex before encoding
function toJson(array $data): string
{
    return json_encode($data, JSON_THROW_ON_ERROR);
}

$filtered = array_filter([3, 8, 12, 5], fn(int $n): bool => $n > 4);
echo toJson($filtered), PHP_EOL;                  // keys preserved: object
echo toJson(array_values($filtered)), PHP_EOL;   // reindexed: array
var_dump(array_is_list($filtered), array_is_list(array_values($filtered)));
