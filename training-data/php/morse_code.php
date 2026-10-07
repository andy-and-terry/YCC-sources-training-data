<?php

const MORSE = [
    'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.', 'F' => '..-.', 'G' => '--.',
    'H' => '....', 'I' => '..', 'J' => '.---', 'K' => '-.-', 'L' => '.-..', 'M' => '--', 'N' => '-.',
    'O' => '---', 'P' => '.--.', 'Q' => '--.-', 'R' => '.-.', 'S' => '...', 'T' => '-', 'U' => '..-',
    'V' => '...-', 'W' => '.--', 'X' => '-..-', 'Y' => '-.--', 'Z' => '--..', '0' => '-----',
    '1' => '.----', '2' => '..---', '3' => '...--', '4' => '....-', '5' => '.....', '6' => '-....',
    '7' => '--...', '8' => '---..', '9' => '----.',
];

function encode(string $text): string
{
    $words = preg_split('/\s+/', strtoupper(trim($text)));
    return implode(' / ', array_map(fn ($w) => implode(' ', array_filter(array_map(fn ($c) => MORSE[$c] ?? null, str_split($w)))), $words));
}

function decode(string $code): string
{
    $rev = array_flip(MORSE);
    return implode(' ', array_map(fn ($w) => implode('', array_map(fn ($s) => $rev[$s] ?? '?', explode(' ', $w))), explode(' / ', $code)));
}

$m = encode('SOS help 2024');
echo $m, PHP_EOL, decode($m), PHP_EOL;
