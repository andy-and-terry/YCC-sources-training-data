<?php

$items = range(1, 7);
foreach (array_chunk($items, 3) as $i => $chunk) {
    echo "chunk $i: " . implode(' ', $chunk) . "\n";
}

$keys = ['name', 'age', 'city'];
$values = ['Ana', 31, 'Lisbon'];
$row = array_combine($keys, $values);
print_r($row);

print_r(array_fill_keys(['x', 'y'], 0));
print_r(array_pad([1, 2], 5, 0));
