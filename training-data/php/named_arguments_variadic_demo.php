<?php

function createUser(string $name, int $age = 18, string $role = 'member'): string
{
    return "$name ($age, $role)";
}

echo createUser(name: 'Ada', role: 'admin') . "\n";
echo createUser(name: 'Bob', age: 25) . "\n";

function sumAll(int ...$numbers): int
{
    return array_sum($numbers);
}

echo sumAll(1, 2, 3, 4) . "\n";

$values = [5, 10, 15];
echo sumAll(...$values) . "\n";
