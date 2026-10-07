<?php
declare(strict_types=1);

function pigWord(string $w): string
{
    if (preg_match('/^([aeiou]|xr|yt)/', $w)) return $w . 'ay';
    if (preg_match('/^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$/', $w, $m)) return $m[2] . $m[1] . 'ay';
    return $w . 'ay';
}

function pigLatin(string $s): string
{
    return implode(' ', array_map('pigWord', preg_split('/\s+/', strtolower($s))));
}

echo pigLatin('quick fast run apple rhythm square'), PHP_EOL;
