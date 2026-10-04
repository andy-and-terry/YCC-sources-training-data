<?php

$employees = [
    ['name' => 'Zoe', 'dept' => 'eng', 'salary' => 100],
    ['name' => 'Adam', 'dept' => 'ops', 'salary' => 80],
    ['name' => 'Bea', 'dept' => 'eng', 'salary' => 120],
    ['name' => 'Cy', 'dept' => 'ops', 'salary' => 80],
];

usort($employees, fn($a, $b) =>
    [$a['dept'], $b['salary'], $a['name']] <=> [$b['dept'], $a['salary'], $b['name']]
);

foreach ($employees as $e) {
    printf("%-4s %-5s %d\n", $e['dept'], $e['name'], $e['salary']);
}

$names = array_column($employees, 'name');
sort($names);
echo implode(',', $names) . "\n";

$byName = array_column($employees, 'salary', 'name');
arsort($byName);
echo json_encode($byName) . "\n";
