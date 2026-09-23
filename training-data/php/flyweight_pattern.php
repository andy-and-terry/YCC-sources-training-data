<?php

// Flyweight shares one immutable object per distinct "intrinsic" state
// (here, a tree's species/texture) across many cheap extrinsic instances
// (each tree's own x/y position) instead of allocating one heavy object
// per tree.
class TreeType
{
    public function __construct(
        public readonly string $name,
        public readonly string $texture,
    ) {
    }

    public function draw(int $x, int $y): string
    {
        return "{$this->name} ({$this->texture}) at ({$x}, {$y})";
    }
}

class TreeTypeFactory
{
    /** @var array<string, TreeType> */
    private array $types = [];

    public function getType(string $name, string $texture): TreeType
    {
        $key = "{$name}:{$texture}";
        if (!isset($this->types[$key])) {
            $this->types[$key] = new TreeType($name, $texture);
        }
        return $this->types[$key];
    }

    public function count(): int
    {
        return count($this->types);
    }
}

$factory = new TreeTypeFactory();
$forest = [];
$positions = [[1, 2], [3, 4], [5, 6]];

foreach ($positions as [$x, $y]) {
    $type = $factory->getType('Oak', 'rough-bark');
    $forest[] = $type->draw($x, $y);
}
$forest[] = $factory->getType('Pine', 'smooth-bark')->draw(7, 8);

foreach ($forest as $entry) {
    echo $entry, PHP_EOL;
}
echo 'distinct tree types: ', $factory->count(), PHP_EOL;
