<?php

function pigWord(string $w): string
{
    if (!preg_match('/^([^aeiou]*?(?:qu)?)([aeiouy].*)$/i', $w, $m) || $m[1] === '') {
        return preg_match('/^[aeiou]/i', $w) ? $w . 'way' : $w . 'ay';
    }
    $out = strtolower($m[2] . $m[1]) . 'ay';
    return ctype_upper($w[0]) ? ucfirst($out) : $out;
}

function pigLatin(string $s): string
{
    return preg_replace_callback('/[A-Za-z]+/', fn ($m) => pigWord($m[0]), $s);
}

echo pigLatin('The quick brown fox jumps over the lazy dog'), PHP_EOL;
echo pigLatin('Hello, rhythm and apple!'), PHP_EOL;
