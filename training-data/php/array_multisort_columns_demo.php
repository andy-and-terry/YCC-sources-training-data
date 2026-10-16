<?php

$rows = [
    ['name' => 'Ann', 'dept' => 'ops', 'pay' => 50],
    ['name' => 'Bob', 'dept' => 'dev', 'pay' => 70],
    ['name' => 'Cy', 'dept' => 'dev', 'pay' => 90],
    ['name' => 'Di', 'dept' => 'ops', 'pay' => 65],
];

$dept = array_column($rows, 'dept');
$pay = array_column($rows, 'pay');
array_multisort($dept, SORT_ASC, $pay, SORT_DESC, $rows);

foreach ($rows as $r) {
    echo "{$r['dept']} {$r['name']} {$r['pay']}\n";
}
