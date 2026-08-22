<?php

class IdGenerator
{
    private static int $counter = 0;

    public static function next(): int
    {
        return ++self::$counter;
    }
}

class Widget
{
    public readonly int $id;

    public function __construct(public string $name)
    {
        $this->id = IdGenerator::next();
    }
}

$a = new Widget('gear');
$b = new Widget('cog');
$c = new Widget('bolt');
foreach ([$a, $b, $c] as $w) {
    echo "$w->id: $w->name\n";
}
