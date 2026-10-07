<?php

$employees = [
    ['id' => 1, 'name' => 'Cleo', 'dept' => 'eng', 'salary' => 120],
    ['id' => 2, 'name' => 'Ada', 'dept' => 'eng', 'salary' => 150],
    ['id' => 3, 'name' => 'Bob', 'dept' => 'ops', 'salary' => 90],
    ['id' => 4, 'name' => 'Dan', 'dept' => 'ops', 'salary' => 95],
];

echo implode(', ', array_column($employees, 'name')), "\n";
print_r(array_column($employees, 'salary', 'name'));
$byId = array_column($employees, null, 'id');
echo $byId[3]['name'], "\n";

usort($employees, fn($a, $b) => [$a['dept'], $b['salary']] <=> [$b['dept'], $a['salary']]);
foreach ($employees as $e) {
    printf("%-4s %-5s %d\n", $e['dept'], $e['name'], $e['salary']);
}

$grouped = [];
foreach ($employees as $e) {
    $grouped[$e['dept']][] = $e['salary'];
}
foreach ($grouped as $dept => $salaries) {
    printf("%s avg %.1f\n", $dept, array_sum($salaries) / count($salaries));
}

array_multisort(array_column($employees, 'name'), SORT_ASC, $employees);
echo $employees[0]['name'], "\n";
