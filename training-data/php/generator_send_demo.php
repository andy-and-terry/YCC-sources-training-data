<?php

function accumulator(): Generator
{
    $total = 0;
    while (true) {
        $value = yield $total;
        if ($value === null) {
            return $total;
        }
        $total += $value;
    }
}

$gen = accumulator();
$gen->current();
echo $gen->send(5) . "\n";
echo $gen->send(10) . "\n";
echo $gen->send(2.5) . "\n";
$gen->send(null);
echo 'final: ' . $gen->getReturn() . "\n";
