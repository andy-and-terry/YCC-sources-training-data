<?php

function compose(callable ...$fns): Closure
{
    return fn($x) => array_reduce(array_reverse($fns), fn($acc, $f) => $f($acc), $x);
}

function pipe(callable ...$fns): Closure
{
    return fn($x) => array_reduce($fns, fn($acc, $f) => $f($acc), $x);
}

function curry(callable $f, ...$bound): Closure
{
    return fn(...$rest) => $f(...$bound, ...$rest);
}

$slugify = pipe(
    'trim',
    'strtolower',
    fn($s) => preg_replace('/[^a-z0-9]+/', '-', $s),
    fn($s) => trim($s, '-'),
);
echo $slugify("  Hello, World! PHP 8  "), "\n";

$addThenDouble = compose(fn($x) => $x * 2, fn($x) => $x + 1);
echo $addThenDouble(5), "\n";

$add = fn($a, $b, $c) => $a + $b + $c;
$add10 = curry($add, 4, 6);
echo $add10(5), "\n";

$strlen = strlen(...);
echo implode(',', array_map($strlen, ['a', 'bb', 'ccc'])), "\n";
