<?php

$stack = new SplStack();
$stack->push(1);
$stack->push(2);
$stack->push(3);
echo $stack->pop() . "\n";
echo $stack->top() . "\n";

$queue = new SplQueue();
$queue->enqueue('a');
$queue->enqueue('b');
$queue->enqueue('c');
echo $queue->dequeue() . "\n";
echo $queue->bottom() . "\n";

foreach ($queue as $item) {
    echo $item . "\n";
}
