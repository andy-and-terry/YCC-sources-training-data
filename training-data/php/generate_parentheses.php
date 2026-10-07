<?php

function balanced(int $n, string $prefix = '', int $open = 0, int $close = 0): Generator
{
    if (strlen($prefix) === 2 * $n) {
        yield $prefix;
        return;
    }
    if ($open < $n) {
        yield from balanced($n, "$prefix(", $open + 1, $close);
    }
    if ($close < $open) {
        yield from balanced($n, "$prefix)", $open, $close + 1);
    }
}

echo implode(' ', iterator_to_array(balanced(3), false)), PHP_EOL;
echo 'n=9: ', iterator_count(balanced(9)), PHP_EOL;
