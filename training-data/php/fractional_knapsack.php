<?php

function fractionalKnapsack(array $items, float $capacity): array
{
    usort($items, fn ($a, $b) => $b['value'] / $b['weight'] <=> $a['value'] / $a['weight']);
    $total = 0.0;
    $taken = [];
    foreach ($items as $it) {
        if ($capacity <= 0) {
            break;
        }
        $take = min($it['weight'], $capacity);
        $total += $it['value'] * $take / $it['weight'];
        $taken[$it['name']] = round($take / $it['weight'], 3);
        $capacity -= $take;
    }
    return [$total, $taken];
}

[$total, $taken] = fractionalKnapsack([
    ['name' => 'gold', 'value' => 60, 'weight' => 10],
    ['name' => 'silver', 'value' => 100, 'weight' => 20],
    ['name' => 'bronze', 'value' => 120, 'weight' => 30],
], 50);
echo "total $total ", json_encode($taken), PHP_EOL;
