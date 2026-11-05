<?php
function make(string $name, int $age = 0, string ...$tags) { return "$name/$age/" . implode('|', $tags); }
echo make(age: 5, name: 'ann'), "\n";
echo make('bob', 1, 'a', 'b'), "\n";
$args = ['name' => 'cy', 'age' => 9];
echo make(...$args), "\n";
