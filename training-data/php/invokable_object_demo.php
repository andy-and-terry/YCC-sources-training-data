<?php

class Multiplier
{
    public function __construct(private int $factor) {}

    public function __invoke(int $x): int
    {
        return $x * $this->factor;
    }
}

class Counter
{
    private int $count = 0;

    public function __invoke(): int
    {
        return ++$this->count;
    }
}

$triple = new Multiplier(3);
echo $triple(7), "\n";
echo implode(',', array_map($triple, [1, 2, 3])), "\n";
echo is_callable($triple) ? "callable\n" : "not callable\n";

$counter = new Counter();
$counter();
$counter();
echo "count: ", $counter(), "\n";

$pipeline = [new Multiplier(2), new Multiplier(5), fn(int $x) => $x + 1];
$result = array_reduce($pipeline, fn($carry, $fn) => $fn($carry), 3);
echo "pipeline: $result\n";
