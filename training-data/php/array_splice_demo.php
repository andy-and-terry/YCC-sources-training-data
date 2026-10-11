<?php

$letters = ['a', 'b', 'c', 'd', 'e'];

$removed = array_splice($letters, 1, 2);
echo implode(',', $removed) . ' | ' . implode(',', $letters) . "\n";

array_splice($letters, 1, 0, ['X', 'Y']);
echo implode(',', $letters) . "\n";

array_splice($letters, -1, 1, ['Z']);
echo implode(',', $letters) . "\n";

print_r(array_slice([10, 20, 30, 40], 1, 2));
