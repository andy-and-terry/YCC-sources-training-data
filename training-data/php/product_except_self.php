<?php

function productExceptSelf(array $a): array
{
    $n = count($a);
    $out = array_fill(0, $n, 1);
    for ($i = 1; $i < $n; $i++) {
        $out[$i] = $out[$i - 1] * $a[$i - 1];
    }
    $suffix = 1;
    for ($i = $n - 1; $i >= 0; $i--) {
        $out[$i] *= $suffix;
        $suffix *= $a[$i];
    }
    return $out;
}

foreach ([[1, 2, 3, 4], [-1, 1, 0, -3, 3], [5, 7]] as $a) {
    echo json_encode($a), ' -> ', json_encode(productExceptSelf($a)), PHP_EOL;
}
