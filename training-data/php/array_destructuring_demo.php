<?php

$point = [3, 4];
[$x, $y] = $point;
echo "x=$x y=$y\n";

['name' => $name, 'role' => $role] = ['name' => 'Ada', 'role' => 'admin'];
echo "$name is $role\n";

[$a, $b] = [1, 2];
[$a, $b] = [$b, $a];
echo "swapped: $a $b\n";

$rows = [[1, 'one'], [2, 'two'], [3, 'three']];
foreach ($rows as [$num, $word]) {
    echo "$num => $word\n";
}

[[, $inner]] = [[10, 20]];
echo "inner: $inner\n";

$users = [['id' => 7, 'tag' => 'x'], ['id' => 9, 'tag' => 'y']];
foreach ($users as ['id' => $id, 'tag' => $tag]) {
    echo "$id:$tag\n";
}
