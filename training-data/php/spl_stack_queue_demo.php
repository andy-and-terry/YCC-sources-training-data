<?php
$stack = new SplStack();
$stack->push(1); $stack->push(2); $stack->push(3);
echo $stack->pop(), $stack->top(), "\n";

$queue = new SplQueue();
$queue->enqueue('a'); $queue->enqueue('b');
echo $queue->dequeue(), count($queue), "\n";

$heap = new SplMinHeap();
foreach ([5, 1, 4] as $n) $heap->insert($n);
foreach ($heap as $n) echo $n, " ";
echo "\n";
