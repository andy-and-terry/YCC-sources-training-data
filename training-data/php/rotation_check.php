<?php
declare(strict_types=1);

function isRotation(string $a, string $b): bool
{
    return strlen($a) === strlen($b) && str_contains($a . $a, $b);
}

var_dump(isRotation('waterbottle', 'erbottlewat'), isRotation('abc', 'acb'));
