<?php
// Leyland numbers: x**y + y**x for x >= y >= 2.
$vals = [];
for ($x = 2; $x <= 4; $x++) {
    for ($y = 2; $y <= $x; $y++) {
        $vals[] = $x ** $y + $y ** $x;
    }
}
echo implode(" ", $vals), "\n";
