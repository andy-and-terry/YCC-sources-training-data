<?php
[$a, $b] = [1, 2];
[$a, $b] = [$b, $a];
echo "$a $b\n";

['x' => $x, 'y' => $y] = ['x' => 10, 'y' => 20];
echo "$x,$y\n";

foreach ([[1, 'one'], [2, 'two']] as [$num, $name]) {
    echo "$num=$name\n";
}
[, $second, , $fourth] = [1, 2, 3, 4];
echo "$second $fourth\n";
