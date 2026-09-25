<?php

function compress(string $s): string
{
    $out = preg_replace_callback('/(.)\1*/s', fn ($m) => $m[1] . strlen($m[0]), $s);
    return strlen($out) < strlen($s) ? $out : $s;
}

function decompress(string $s): string
{
    return preg_replace_callback('/(\D)(\d+)/', fn ($m) => str_repeat($m[1], (int) $m[2]), $s);
}

foreach (['aabcccccaaa', 'abc', 'wwwwwwwwwwwwbbbx'] as $s) {
    $c = compress($s);
    echo "$s -> $c", $c !== $s ? ' -> ' . decompress($c) : '', PHP_EOL;
}
