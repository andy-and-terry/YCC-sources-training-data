<?php
function box(int $w, int $h, string $label = "box"): string { return "$label {$w}x{$h}"; }
echo box(h: 2, w: 3), "\n";
$args = ['w' => 5, 'h' => 6, 'label' => 'big'];
echo box(...$args), "\n";
echo implode(",", [...[1, 2], ...[3]]), "\n";
