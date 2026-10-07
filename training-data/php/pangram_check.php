<?php
declare(strict_types=1);

function isPangram(string $s): bool
{
    return count(array_unique(str_split(preg_replace('/[^a-z]/', '', strtolower($s)) ?: ' '))) === 26;
}

var_dump(isPangram('The quick brown fox jumps over the lazy dog'), isPangram('Hello world'));
