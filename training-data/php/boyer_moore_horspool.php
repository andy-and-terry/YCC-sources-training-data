<?php

/** @return list<int> */
function horspool(string $text, string $pattern): array
{
    $m = strlen($pattern);
    $n = strlen($text);
    if ($m === 0 || $m > $n) {
        return [];
    }
    $shift = [];
    for ($i = 0; $i < $m - 1; $i++) {
        $shift[$pattern[$i]] = $m - 1 - $i;
    }
    $matches = [];
    for ($i = 0; $i <= $n - $m; $i += $shift[$text[$i + $m - 1]] ?? $m) {
        if (substr_compare($text, $pattern, $i, $m) === 0) {
            $matches[] = $i;
        }
    }
    return $matches;
}

$text = 'here is a simple example, an example indeed';
echo implode(',', horspool($text, 'example')), ' (strpos: ', strpos($text, 'example'), ')', PHP_EOL;
