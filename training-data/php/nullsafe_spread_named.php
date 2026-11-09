<?php
function make(string $name, int $age = 0, string ...$tags) {
    return "$name/$age/" . implode("|", $tags);
}
echo make(age: 5, name: "Ann"), "\n";
echo make("Bob", 3, ...["x", "y"]), "\n";
$o = null;
var_dump($o?->foo?->bar);
