<?php

function linearSearch(array $arr, int $target): int
{
    foreach ($arr as $i => $value) {
        if ($value === $target) {
            return $i;
        }
    }
    return -1;
}

$data = [4, 2, 9, 7, 1];
echo linearSearch($data, 7) . "\n";
echo linearSearch($data, 100) . "\n";
