<?php

declare(strict_types=1);

$data = new ArrayObject(['b' => 2, 'a' => 1, 'c' => 3]);

$data['d'] = 4;
echo count($data), "\n";
echo isset($data['a']) ? "has a\n" : "no a\n";
unset($data['b']);

$data->ksort();
foreach ($data as $key => $value) {
    echo "$key=$value\n";
}

print_r($data->getArrayCopy());

$iterator = $data->getIterator();
echo get_class($iterator), "\n";

$props = new ArrayObject(['x' => 1], ArrayObject::ARRAY_AS_PROPS);
$props->y = 2;
echo $props['x'] + $props['y'], "\n";
