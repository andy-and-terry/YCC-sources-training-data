<?php

class Stack
{
    private array $items = [];

    public function push($item): void
    {
        $this->items[] = $item;
    }

    public function pop()
    {
        return array_pop($this->items);
    }

    public function peek()
    {
        return end($this->items);
    }

    public function isEmpty(): bool
    {
        return empty($this->items);
    }
}

$stack = new Stack();
$stack->push(1);
$stack->push(2);
$stack->push(3);
echo $stack->pop() . " " . $stack->peek() . " " . ($stack->isEmpty() ? "true" : "false") . "\n";
