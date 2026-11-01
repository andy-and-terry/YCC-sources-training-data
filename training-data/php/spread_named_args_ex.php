<?php
function box(int $w, int $h, string $unit = "cm"): string {
    return "{$w}x{$h}{$unit}";
}
echo box(h: 4, w: 2), "\n";
$args = ['w' => 5, 'h' => 6, 'unit' => 'mm'];
echo box(...$args), "\n";
function total(int ...$n) { return array_sum($n); }
echo total(...[1, 2, 3]), "\n";
