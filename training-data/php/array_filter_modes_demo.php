<?php

$scores = ['ann' => 91, 'bob' => 58, 'cy' => 77, 'di' => 40];

print_r(array_filter($scores, fn($s) => $s >= 60));
print_r(array_filter($scores, fn($k) => strlen($k) === 2, ARRAY_FILTER_USE_KEY));
print_r(array_filter($scores, fn($s, $k) => $s > 50 && $k !== 'cy', ARRAY_FILTER_USE_BOTH));
print_r(array_filter([0, 1, '', null, 'a', false, []]));
