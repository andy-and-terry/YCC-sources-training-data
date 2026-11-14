<?php
function box(int $w, int $h = 1, string $unit = 'cm'): string {
    return "{$w}x{$h}{$unit}";
}

echo box(h: 5, w: 2), PHP_EOL;
echo box(...['w' => 3, 'unit' => 'mm']), PHP_EOL;
