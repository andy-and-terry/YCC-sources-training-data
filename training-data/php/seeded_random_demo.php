<?php

mt_srand(42);
$first = [mt_rand(1, 100), mt_rand(1, 100), mt_rand(1, 100)];
mt_srand(42);
$second = [mt_rand(1, 100), mt_rand(1, 100), mt_rand(1, 100)];

echo implode(',', $first) . "\n";
echo ($first === $second ? 'reproducible' : 'different') . "\n";

$bytes = random_bytes(4);
echo strlen(bin2hex($bytes)) . " hex chars\n";
$n = random_int(5, 5);
echo "random_int(5,5) = $n\n";
