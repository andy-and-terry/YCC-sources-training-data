<?php

interface Countable2
{
    public function count(): int;
}

interface Printable
{
    public function display(): string;
}

class Basket implements Countable2, Printable
{
    private array $items = [];

    public function add(string $item): void
    {
        $this->items[] = $item;
    }

    public function count(): int
    {
        return count($this->items);
    }

    public function display(): string
    {
        return implode(', ', $this->items);
    }
}

function describe(Countable2&Printable $collection): string
{
    return "{$collection->count()} items: {$collection->display()}";
}

function normalize(int|float $number): string
{
    return number_format((float) $number, 2);
}

$basket = new Basket();
$basket->add('apple');
$basket->add('bread');
echo describe($basket) . "\n";
echo normalize(3) . "\n";
echo normalize(4.5) . "\n";
