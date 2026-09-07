<?php

class DynamicBag
{
    private array $data = [];

    public function __get(string $name): mixed
    {
        return $this->data[$name] ?? null;
    }

    public function __set(string $name, mixed $value): void
    {
        $this->data[$name] = $value;
    }

    public function __isset(string $name): bool
    {
        return isset($this->data[$name]);
    }

    public function __call(string $name, array $args): mixed
    {
        return "called $name with (" . implode(', ', $args) . ')';
    }

    public function __toString(): string
    {
        return 'DynamicBag(' . json_encode($this->data) . ')';
    }
}

$bag = new DynamicBag();
$bag->name = 'Ada';
$bag->age = 30;
echo $bag->name . "\n";
echo (isset($bag->age) ? 'has age' : 'no age') . "\n";
echo $bag->greet('hello', 'world') . "\n";
echo $bag . "\n";
