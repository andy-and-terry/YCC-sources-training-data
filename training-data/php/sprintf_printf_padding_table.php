<?php
$rows = [['apple', 3, 1.5], ['kiwi', 12, 0.25]];
printf("%-8s|%4s|%8s\n", 'item', 'qty', 'price');
foreach ($rows as [$n, $q, $p]) printf("%-8s|%4d|%8.2f\n", $n, $q, $p);
printf("%'*10s|%+d|%5.1e|%u\n", 'pad', 5, 12345.678, 3);
echo sprintf('%2$s %1$s', 'world', 'hello'), PHP_EOL;
