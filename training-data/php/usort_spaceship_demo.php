<?php

$people = [
    ['name' => 'Cara', 'age' => 30],
    ['name' => 'Abe',  'age' => 25],
    ['name' => 'Bob',  'age' => 30],
];

// Sort by age descending, then name ascending.
usort($people, fn($x, $y) => [$y['age'], $x['name']] <=> [$x['age'], $y['name']]);
echo implode(', ', array_column($people, 'name')), "\n";

$words = ['banana', 'apple', 'Cherry'];
sort($words, SORT_FLAG_CASE | SORT_STRING);
echo implode(' ', $words), "\n";

$scores = ['a' => 3, 'b' => 9, 'c' => 5];
arsort($scores);
echo json_encode($scores), "\n";
uksort($scores, fn($k1, $k2) => strcmp($k2, $k1));
echo json_encode($scores), "\n";
