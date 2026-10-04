<?php

[$a, $b, $c] = [1, 2, 3];
echo "$a $b $c\n";

[, $second, , $fourth] = ['w', 'x', 'y', 'z'];
echo "$second $fourth\n";

['name' => $name, 'age' => $age] = ['name' => 'Ada', 'age' => 36];
echo "$name is $age\n";

[$x, $y] = [10, 20];
[$x, $y] = [$y, $x];
echo "swapped: $x $y\n";

[[$p, $q], [$r, $s]] = [[1, 2], [3, 4]];
echo $p + $q + $r + $s, "\n";

$points = [['x' => 1, 'y' => 2], ['x' => 3, 'y' => 4]];
foreach ($points as ['x' => $px, 'y' => $py]) {
    echo "($px, $py)\n";
}

function minMax(array $values): array
{
    return [min($values), max($values)];
}
[$lo, $hi] = minMax([4, 9, -1, 7]);
echo "range: $lo..$hi\n";

$list = [1, 2, 3, 4];
[$head] = $list;
$tail = array_slice($list, 1);
echo $head, ' ', implode(',', $tail), "\n";
