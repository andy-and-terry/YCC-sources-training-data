<?php

function trap(array $h): int
{
    [$l, $r, $lMax, $rMax, $water] = [0, count($h) - 1, 0, 0, 0];
    while ($l < $r) {
        if ($h[$l] < $h[$r]) {
            $lMax = max($lMax, $h[$l]);
            $water += $lMax - $h[$l++];
        } else {
            $rMax = max($rMax, $h[$r]);
            $water += $rMax - $h[$r--];
        }
    }
    return $water;
}

foreach ([[0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1], [4, 2, 0, 3, 2, 5], [1, 2, 3]] as $h) {
    echo json_encode($h), ' -> ', trap($h), PHP_EOL;
}
