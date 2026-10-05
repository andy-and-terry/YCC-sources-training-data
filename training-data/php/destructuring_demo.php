<?php

[$a, $b] = [1, 2];
[$a, $b] = [$b, $a];
echo "$a $b\n";

[, $second, , $fourth] = [10, 20, 30, 40];
echo "$second $fourth\n";

['name' => $name, 'age' => $age] = ['name' => 'Ada', 'age' => 36];
echo "$name is $age\n";

[[$x, $y], [$z]] = [[1, 2], [3]];
echo $x + $y + $z, "\n";

$points = [['x' => 1, 'y' => 2], ['x' => 3, 'y' => 4]];
foreach ($points as ['x' => $px, 'y' => $py]) {
    echo "($px, $py) ";
}
echo "\n";

function range3(): array { return [1, 2, 3]; }
[$first, , $last] = range3();
echo "$first-$last\n";
