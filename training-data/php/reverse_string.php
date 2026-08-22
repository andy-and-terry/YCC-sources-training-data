<?php

function reverseString(string $s): string
{
    return strrev($s);
}

function reverseWords(string $s): string
{
    return implode(' ', array_reverse(explode(' ', $s)));
}

echo reverseString('hello') . "\n";
echo reverseWords('the quick brown fox') . "\n";
