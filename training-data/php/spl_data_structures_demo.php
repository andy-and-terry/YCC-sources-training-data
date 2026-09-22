<?php

// The Standard PHP Library ships ready-made data structures so common
// ones rarely need hand-rolling: a stack, a FIFO queue, and a priority
// queue backed by a binary heap.

$stack = new SplStack();
$stack->push(1);
$stack->push(2);
$stack->push(3);
echo 'stack pop order: ';
while (!$stack->isEmpty()) {
    echo $stack->pop() . ' ';
}
echo "\n";

$queue = new SplQueue();
$queue->enqueue('a');
$queue->enqueue('b');
$queue->enqueue('c');
echo 'queue dequeue order: ';
while (!$queue->isEmpty()) {
    echo $queue->dequeue() . ' ';
}
echo "\n";

$priorityQueue = new SplPriorityQueue();
$priorityQueue->insert('low priority task', 1);
$priorityQueue->insert('urgent task', 10);
$priorityQueue->insert('medium priority task', 5);
echo 'priority queue extraction order:' . "\n";
foreach ($priorityQueue as $task) {
    echo "  {$task}\n";
}

$fixedArray = new SplFixedArray(3);
$fixedArray[0] = 'x';
$fixedArray[1] = 'y';
$fixedArray[2] = 'z';
echo 'fixed array: ' . implode(',', $fixedArray->toArray()) . "\n";
