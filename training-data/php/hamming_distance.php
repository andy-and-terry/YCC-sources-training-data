<?php

function hamming(string $a, string $b): int
{
    if (strlen($a) !== strlen($b)) {
        throw new LengthException('strings must have equal length');
    }
    return count(array_diff_assoc(str_split($a), str_split($b)));
}

function hammingBits(int $x, int $y): int
{
    return substr_count(decbin($x ^ $y), '1');
}

echo hamming('karolin', 'kathrin'), ' ', hammingBits(1, 4), ' ', hammingBits(PHP_INT_MAX, 0), PHP_EOL;
try {
    hamming('abc', 'ab');
} catch (LengthException $e) {
    echo 'error: ', $e->getMessage(), PHP_EOL;
}
