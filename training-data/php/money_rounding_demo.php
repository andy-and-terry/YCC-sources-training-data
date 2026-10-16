<?php

function toCents(string $amount): int
{
    return (int) round(((float) $amount) * 100);
}

function fromCents(int $cents): string
{
    return number_format($cents / 100, 2, '.', '');
}

$prices = ['19.99', '0.10', '0.20'];
$sum = array_sum(array_map('toCents', $prices));
echo fromCents($sum) . "\n";

echo 0.1 + 0.2 . "\n";
echo round(1.005, 2) . ' ' . round(2.675, 2) . "\n";
echo floor(-1.5) . ' ' . ceil(-1.5) . ' ' . round(-1.5) . "\n";

$split = intdiv(1000, 3);
echo fromCents($split) . ' x2 + ' . fromCents(1000 - 2 * $split) . "\n";
