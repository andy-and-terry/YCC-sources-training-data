<?php

function isAnagram(string $a, string $b): bool
{
    if (strlen($a) !== strlen($b)) {
        return false;
    }
    $countsA = count_chars(strtolower($a), 1);
    $countsB = count_chars(strtolower($b), 1);
    return $countsA === $countsB;
}

var_dump(isAnagram('listen', 'silent'));
var_dump(isAnagram('triangle', 'integral'));
var_dump(isAnagram('apple', 'papel'));
var_dump(isAnagram('hello', 'world'));
