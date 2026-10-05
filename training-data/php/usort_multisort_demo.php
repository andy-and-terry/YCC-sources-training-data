<?php

$people = [
    ['name' => 'Cy', 'age' => 30],
    ['name' => 'Ann', 'age' => 25],
    ['name' => 'Bob', 'age' => 30],
];

usort($people, fn($a, $b) => [$b['age'], $a['name']] <=> [$a['age'], $b['name']]);
echo implode(", ", array_column($people, 'name')), "\n";

$data = [3, 1, 2];
$labels = ['c', 'a', 'b'];
array_multisort($data, SORT_ASC, $labels);
echo implode("", $labels), "\n";

$assoc = ['b' => 2, 'a' => 3, 'c' => 1];
asort($assoc);
echo json_encode($assoc), "\n";
ksort($assoc);
echo json_encode($assoc), "\n";
arsort($assoc);
echo json_encode($assoc), "\n";
