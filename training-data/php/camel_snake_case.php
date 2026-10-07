<?php

/** @return list<string> */
function words(string $s): array
{
    $s = preg_replace(['/([A-Z]+)([A-Z][a-z])/', '/([a-z\d])([A-Z])/'], '$1 $2', $s);
    return array_values(array_map('strtolower', preg_split('/[\s_\-]+/', $s, -1, PREG_SPLIT_NO_EMPTY)));
}

function toCamel(string $s): string
{
    $w = words($s);
    return $w[0] . implode('', array_map('ucfirst', array_slice($w, 1)));
}

function toPascal(string $s): string
{
    return implode('', array_map('ucfirst', words($s)));
}

function toSnake(string $s): string
{
    return implode('_', words($s));
}

function toKebab(string $s): string
{
    return implode('-', words($s));
}

foreach (['parseHTTPResponse', 'user_id', 'background-color', 'XMLHttpRequest'] as $s) {
    printf("%-18s %-18s %-18s %-20s %s\n", $s, toCamel($s), toPascal($s), toSnake($s), toKebab($s));
}
