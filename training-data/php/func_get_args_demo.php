<?php

// Legacy-style variadics: func_get_args() and friends read the actual
// arguments passed, regardless of the declared parameters.
function total(): int|float
{
    $sum = 0;
    foreach (func_get_args() as $n) {
        $sum += $n;
    }
    return $sum;
}

function describeArgs(string $label): string
{
    $count = func_num_args();
    $extras = array_slice(func_get_args(), 1);
    return "$label got $count args, extras: " . json_encode($extras);
}

function secondArg(): mixed
{
    return func_num_args() > 1 ? func_get_arg(1) : null;
}

echo total(1, 2, 3, 4.5), PHP_EOL;
echo total(), PHP_EOL;
echo describeArgs('call'), PHP_EOL;
echo describeArgs('call', 'a', 'b'), PHP_EOL;
var_dump(secondArg('x', 'y'), secondArg('only'));

// The modern equivalent is a variadic parameter
function totalModern(int|float ...$nums): int|float
{
    return array_sum($nums);
}
echo totalModern(1, 2, 3, 4.5), PHP_EOL;
