<?php

function parseQuery(string $qs): array
{
    $out = [];
    foreach (explode('&', ltrim($qs, '?')) as $pair) {
        if ($pair === '') {
            continue;
        }
        [$k, $v] = array_pad(explode('=', $pair, 2), 2, '');
        $out[urldecode($k)][] = urldecode($v);
    }
    return $out;
}

function buildQuery(array $params): string
{
    $parts = [];
    foreach ($params as $k => $values) {
        foreach ((array) $values as $v) {
            $parts[] = urlencode($k) . '=' . urlencode($v);
        }
    }
    return implode('&', $parts);
}

$parsed = parseQuery('?name=J%C3%BCrgen+M&tag=a&tag=b&empty=&flag');
echo json_encode($parsed, JSON_UNESCAPED_UNICODE), PHP_EOL;
echo buildQuery($parsed), PHP_EOL;
