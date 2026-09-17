<?php

class Queue
{
    private array $items = [];

    public function enqueue($item): void
    {
        $this->items[] = $item;
    }

    public function dequeue()
    {
        return array_shift($this->items);
    }

    public function peek()
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
echo $queue->dequeue() . " " . $queue->peek() . " " . ($queue->isEmpty() ? "true" : "false") . "\n";
