<?php

$prices = ['apple' => 1.5, 'pear' => 2.0, 'plum' => 0.75];

array_walk($prices, function (&$price, $name) {
    $price = round($price * 1.1, 2);
});
print_r($prices);

$total = array_reduce($prices, fn(float $carry, float $p) => $carry + $p, 0.0);
echo "total: $total\n";

$words = ['php', 'is', 'fun'];
$lengths = array_map('strlen', $words);
echo implode(',', $lengths) . "\n";

$named = array_map(fn($w, $n) => "$n:$w", $words, array_keys($words));
echo implode(' ', $named) . "\n";

$longest = array_reduce($words, fn($c, $w) => strlen($w) > strlen($c) ? $w : $c, '');
echo "longest: $longest\n";
