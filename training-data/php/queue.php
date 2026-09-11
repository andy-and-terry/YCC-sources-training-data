<?php

class Queue
{
    private array $items = [];

    public function enqueue(mixed $item): void
    {
        $this->items[] = $item;
    }

    public function dequeue(): mixed
    {
        return array_shift($this->items);
    }

    public function peek(): mixed
    {
        return $this->items[0] ?? null;
    }

    public function isEmpty(): bool
    {
        return empty($this->items);
    }
}

$queue = new Queue();
$queue->enqueue(1);
$queue->enqueue(2);
$queue->enqueue(3);
echo $queue->dequeue() . "\n";
echo $queue->dequeue() . "\n";
echo $queue->peek() . "\n";
echo ($queue->isEmpty() ? 'empty' : 'not empty') . "\n";
