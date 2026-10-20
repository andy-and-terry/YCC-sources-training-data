<?php
function box(int $w, int $h = 1, string $label = ''): string
{
    return "$label{$w}x{$h}";
}

echo box(h: 3, w: 2), PHP_EOL;
echo box(2, label: 'L:'), PHP_EOL;
$args = ['w' => 5, 'label' => 'S:'];
echo box(...$args), PHP_EOL;
function total(int ...$n): int { return array_sum($n); }
echo total(...[1, 2, 3], ...[4]), PHP_EOL;
