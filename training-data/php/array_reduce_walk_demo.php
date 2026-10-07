<?php

$orders = [
    ['id' => 1, 'total' => 25.5],
    ['id' => 2, 'total' => 40.0],
    ['id' => 3, 'total' => 10.25],
];

$sum = array_reduce($orders, fn(float $carry, array $o) => $carry + $o['total'], 0.0);
echo "sum: $sum\n";

array_walk($orders, function (array &$o, int $k, float $rate) {
    $o['with_tax'] = round($o['total'] * (1 + $rate), 2);
}, 0.1);
echo implode(", ", array_column($orders, 'with_tax')), "\n";

$byId = array_column($orders, 'total', 'id');
print_r($byId);
echo implode(",", array_keys(array_filter($byId, fn($t) => $t > 20))), "\n";
