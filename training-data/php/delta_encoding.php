<?php
function encode(array $xs): array {
    return array_map(fn($x, $i) => $i ? $x - $xs[$i - 1] : $x, $xs, array_keys($xs));
}

function decode(array $ds): array {
    $acc = 0;
    return array_map(function ($d) use (&$acc) { return $acc += $d; }, $ds);
}

$d = encode([10, 12, 15, 15, 20]);
echo implode(',', $d), ' | ', implode(',', decode($d)), "\n";
