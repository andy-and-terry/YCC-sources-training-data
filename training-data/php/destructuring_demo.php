<?php

[$a, $b] = [1, 2];
[$a, $b] = [$b, $a];
echo "$a $b\n";

[, , $third] = ['x', 'y', 'z'];
echo $third, "\n";

['id' => $id, 'name' => $name] = ['id' => 7, 'name' => 'Ada', 'extra' => true];
echo "$id $name\n";

$rows = [[1, 'one'], [2, 'two']];
foreach ($rows as [$num, $word]) {
    echo "$num=$word\n";
}

[[ 'x' => $x ], [ 'x' => $y ]] = [['x' => 10], ['x' => 20]];
echo $x + $y, "\n";
