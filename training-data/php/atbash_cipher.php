<?php

function atbash(string $s): string
{
    return strtr($s, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', 'zyxwvutsrqponmlkjihgfedcbaZYXWVUTSRQPONMLKJIHGFEDCBA');
}

$enc = atbash('Hello, World!');
echo $enc, ' | ', atbash($enc), PHP_EOL;
