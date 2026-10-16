<?php

function naturals(): Generator
{
    $n = 1;
    while (true) {
        yield $n++;
    }
}

function take(iterable $it, int $count): Generator
{
    foreach ($it as $value) {
        if ($count-- <= 0) {
            return;
        }
        yield $value;
    }
}

function filter(iterable $it, callable $pred): Generator
{
    foreach ($it as $value) {
        if ($pred($value)) {
            yield $value;
        }
    }
}

$evensSquared = take(filter(naturals(), fn($n) => $n % 2 === 0), 5);
echo implode(' ', array_map(fn($n) => $n ** 2, iterator_to_array($evensSquared, false))) . "\n";
