<?php

const KEYPAD = ['2' => 'abc', '3' => 'def', '4' => 'ghi', '5' => 'jkl', '6' => 'mno', '7' => 'pqrs', '8' => 'tuv', '9' => 'wxyz'];

function letterCombinations(string $digits): array
{
    if ($digits === '') {
        return [];
    }
    $out = [''];
    foreach (str_split($digits) as $d) {
        $next = [];
        foreach ($out as $prefix) {
            foreach (str_split(KEYPAD[$d]) as $c) {
                $next[] = $prefix . $c;
            }
        }
        $out = $next;
    }
    return $out;
}

echo implode(' ', letterCombinations('23')), PHP_EOL;
echo count(letterCombinations('7979')), PHP_EOL;
