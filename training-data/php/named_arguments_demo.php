<?php

function makeUser(
    string $name,
    int $age = 30,
    string $role = 'member',
    bool $active = true
): string {
    return sprintf("%s (%d) role=%s active=%s", $name, $age, $role, $active ? 'yes' : 'no');
}

// positional
echo makeUser('Ann', 25, 'admin', false), "\n";

// skip optional parameters by naming the one you want
echo makeUser('Bob', role: 'editor'), "\n";

// order does not matter once named
echo makeUser(active: false, name: 'Cy'), "\n";

// built-in functions accept names too
echo str_pad(string: 'x', length: 5, pad_string: '-', pad_type: STR_PAD_BOTH), "\n";
echo json_encode(value: ['a' => 1, 'b' => [1, 2]], flags: JSON_PRETTY_PRINT), "\n";

// spreading an associative array maps keys to parameter names
$args = ['name' => 'Di', 'age' => 41];
echo makeUser(...$args), "\n";

// constructor promotion works well with named arguments
class Point
{
    public function __construct(
        public readonly int $x = 0,
        public readonly int $y = 0,
        public readonly int $z = 0,
    ) {}
}

$p = new Point(y: 5, z: 9);
echo "Point({$p->x}, {$p->y}, {$p->z})\n";

// unknown or duplicate names raise errors
try {
    makeUser('Eve', agee: 3);
} catch (Error $e) {
    echo get_class($e), ": ", $e->getMessage(), "\n";
}
