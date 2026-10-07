<?php
declare(strict_types=1);

const PLAIN = 'abcdefghijklmnopqrstuvwxyz';

function atbashDecode(string $text): string
{
    return strtr(preg_replace('/[^a-z0-9]/', '', strtolower($text)), PLAIN, strrev(PLAIN));
}

function atbashEncode(string $text): string
{
    return implode(' ', str_split(atbashDecode($text), 5));
}

$e = atbashEncode('The quick brown fox');
echo $e, ' -> ', atbashDecode($e), PHP_EOL;
