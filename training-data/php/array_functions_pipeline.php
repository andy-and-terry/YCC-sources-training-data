<?php
$people = [
    ['n' => 'Ann', 'age' => 31, 'dept' => 'eng'],
    ['n' => 'Bob', 'age' => 25, 'dept' => 'ops'],
    ['n' => 'Cy', 'age' => 40, 'dept' => 'eng'],
];
echo implode(',', array_column($people, 'n')), PHP_EOL;
echo implode(',', array_keys(array_filter($people, fn($p) => $p['age'] > 30))), PHP_EOL;
usort($people, fn($a, $b) => $b['age'] <=> $a['age']);
echo $people[0]['n'], PHP_EOL;
$byDept = [];
foreach ($people as $p) $byDept[$p['dept']][] = $p['n'];
print_r($byDept);
echo array_sum(array_column($people, 'age')) / count($people), PHP_EOL;
print_r(array_chunk([1, 2, 3, 4, 5], 2));
print_r(array_combine(['a', 'b'], [1, 2]));
