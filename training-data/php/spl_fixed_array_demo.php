<?php

$arr = new SplFixedArray(5);
foreach (range(0, 4) as $i) {
    $arr[$i] = $i * $i;
}
echo implode(',', $arr->toArray()), "\n";
echo 'size: ', $arr->getSize(), "\n";

try {
    $arr[5] = 99;
} catch (RuntimeException $e) {
    echo 'error: ', $e->getMessage(), "\n";
}

$arr->setSize(7);
var_dump($arr[6]);
