<?php
function sum(int ...$nums): int {
    return array_sum($nums);
}
$a = [1, 2, 3];
$b = [4, 5];
echo sum(...$a, ...$b), "\n";
$merged = [...$a, ...$b, 6];
echo implode(",", $merged), "\n";
$defaults = ['color' => 'red', 'size' => 'M'];
$custom = [...$defaults, 'size' => 'L'];
echo json_encode($custom), "\n";
