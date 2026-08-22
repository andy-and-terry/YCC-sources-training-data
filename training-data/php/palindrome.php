<?php

function isPalindrome(string $s): bool
{
    $cleaned = preg_replace('/[^a-z0-9]/', '', strtolower($s));
    return $cleaned === strrev($cleaned);
}

var_dump(isPalindrome("A man a plan a canal Panama"));
var_dump(isPalindrome("hello"));
