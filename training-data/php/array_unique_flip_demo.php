<?php

$tags = ['php', 'sql', 'php', 'go', 'sql', 'rust'];

print_r(array_values(array_unique($tags)));
print_r(array_count_values($tags));

$index = array_flip(array_unique($tags));
print_r($index);

$dupes = array_keys(array_filter(array_count_values($tags), fn($c) => $c > 1));
echo implode(',', $dupes) . "\n";
