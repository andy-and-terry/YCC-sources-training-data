<?php

function isValid(string $s): bool
{
    $pairs = [')' => '(', ']' => '[', '}' => '{'];
    $stack = [];
    for ($i = 0; $i < strlen($s); $i++) {
        $ch = $s[$i];
        if (in_array($ch, ['(', '[', '{'], true)) {
            $stack[] = $ch;
        } elseif (isset($pairs[$ch])) {
            if (empty($stack) || array_pop($stack) !== $pairs[$ch]) {
                return false;
            }
        }
    }
    return empty($stack);
}

var_dump(isValid('([{}])'));
var_dump(isValid('([)]'));
