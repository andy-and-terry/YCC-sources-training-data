<?php

class Collection implements ArrayAccess, Iterator
{
    private array $items = [];
    private int $position = 0;

    public function offsetExists(mixed $offset): bool
    {
        return isset($this->items[$offset]);
    }

    public function offsetGet(mixed $offset): mixed
    {
        return $this->items[$offset] ?? null;
    }

    public function offsetSet(mixed $offset, mixed $value): void
    {
        if ($offset === null) {
            $this->items[] = $value;
        } else {
            $this->items[$offset] = $value;
        }
    }

    public function offsetUnset(mixed $offset): void
    {
        unset($this->items[$offset]);
    }

    public function current(): mixed
    {
        return $this->items[array_keys($this->items)[$this->position]];
    }

    public function key(): mixed
    {
        return array_keys($this->items)[$this->position];
    }

    public function next(): void
    {
        $this->position++;
    }

    public function rewind(): void
    {
        $this->position = 0;
    }

    public function valid(): bool
    {
        return $this->position < count($this->items);
    }
}

$collection = new Collection();
$collection[] = 'a';
$collection[] = 'b';
$collection['x'] = 'c';

foreach ($collection as $key => $value) {
    echo "$key => $value\n";
}

echo ($collection->offsetExists('x') ? 'has x' : 'no x') . "\n";
unset($collection['x']);
echo ($collection->offsetExists('x') ? 'has x' : 'no x') . "\n";
