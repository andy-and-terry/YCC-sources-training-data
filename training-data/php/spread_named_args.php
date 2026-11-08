<?php
function area(int $w, int $h, string $unit = 'cm'): string { return $w * $h . $unit; }

$args = ['h' => 4, 'w' => 5];
echo area(...$args), "\n";
echo area(unit: 'm', w: 2, h: 3), "\n";
function sum(int ...$n) { return array_sum($n); }
echo sum(...[1, 2, 3]), "\n";
