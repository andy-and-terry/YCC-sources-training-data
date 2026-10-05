<?php

$stack = new SplStack();
$stack->push(1);
$stack->push(2);
$stack->push(3);
echo $stack->pop(), " ", $stack->top(), "\n";

$queue = new SplQueue();
$queue->enqueue('a');
$queue->enqueue('b');
echo $queue->dequeue(), " ", count($queue), "\n";

$heap = new SplMinHeap();
foreach ([5, 1, 4, 2] as $n) {
    $heap->insert($n);
}
while (!$heap->isEmpty()) {
    echo $heap->extract(), " ";
}
echo "\n";

$fixed = new SplFixedArray(3);
$fixed[0] = 'x';
echo $fixed->getSize(), "\n";
