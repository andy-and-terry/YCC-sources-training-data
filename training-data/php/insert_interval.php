<?php
function insertInterval(array $iv, array $new): array {
    $out = [];
    $i = 0;
    $n = count($iv);
    while ($i < $n && $iv[$i][1] < $new[0]) {
        $out[] = $iv[$i++];
    }
    while ($i < $n && $iv[$i][0] <= $new[1]) {
        $new = [min($new[0], $iv[$i][0]), max($new[1], $iv[$i][1])];
        $i++;
    }
    $out[] = $new;
    return array_merge($out, array_slice($iv, $i));
}

echo json_encode(insertInterval([[1, 3], [6, 9]], [2, 5])), "\n"; // [[1,5],[6,9]]
