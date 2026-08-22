<?php

function buildFailureTable(string $pattern): array
{
    $n = strlen($pattern);
    $fail = array_fill(0, $n, 0);
    $k = 0;
    for ($i = 1; $i < $n; $i++) {
        while ($k > 0 && $pattern[$k] !== $pattern[$i]) {
            $k = $fail[$k - 1];
        }
        if ($pattern[$k] === $pattern[$i]) {
            $k++;
        }
        $fail[$i] = $k;
    }
    return $fail;
}

function kmpSearch(string $text, string $pattern): array
{
    if ($pattern === '') {
        return [];
    }
    $fail = buildFailureTable($pattern);
    $matches = [];
    $k = 0;
    for ($i = 0; $i < strlen($text); $i++) {
        while ($k > 0 && $pattern[$k] !== $text[$i]) {
            $k = $fail[$k - 1];
        }
        if ($pattern[$k] === $text[$i]) {
            $k++;
        }
        if ($k === strlen($pattern)) {
            $matches[] = $i - $k + 1;
            $k = $fail[$k - 1];
        }
    }
    return $matches;
}

print_r(kmpSearch('ababcababcabc', 'abc'));
