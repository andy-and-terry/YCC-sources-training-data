<?php

function schedule(array $jobs): array
{
    usort($jobs, fn ($a, $b) => $b['profit'] <=> $a['profit']);
    $maxD = max(array_column($jobs, 'deadline'));
    $slots = array_fill(1, $maxD, null);
    foreach ($jobs as $job) {
        for ($t = $job['deadline']; $t > 0; $t--) {
            if ($slots[$t] === null) {
                $slots[$t] = $job;
                break;
            }
        }
    }
    $chosen = array_values(array_filter($slots));
    return [array_column($chosen, 'id'), array_sum(array_column($chosen, 'profit'))];
}

[$order, $profit] = schedule([
    ['id' => 'a', 'deadline' => 2, 'profit' => 100],
    ['id' => 'b', 'deadline' => 1, 'profit' => 19],
    ['id' => 'c', 'deadline' => 2, 'profit' => 27],
    ['id' => 'd', 'deadline' => 1, 'profit' => 25],
    ['id' => 'e', 'deadline' => 3, 'profit' => 15],
]);
echo implode(' ', $order), " profit=$profit", PHP_EOL;
