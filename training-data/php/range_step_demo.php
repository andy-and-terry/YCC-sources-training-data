<?php

echo implode(' ', range(0, 20, 5)) . "\n";
echo implode(' ', range(10, 0, -2)) . "\n";
echo implode(' ', range('a', 'f')) . "\n";
echo implode(' ', range(0, 1, 0.25)) . "\n";

foreach (array_map(null, range(1, 3), range('x', 'z')) as [$n, $c]) {
    echo "$n$c ";
}
echo "\n";
