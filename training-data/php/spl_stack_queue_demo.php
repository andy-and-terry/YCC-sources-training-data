<?php

$stack = new SplStack();
foreach ([1, 2, 3] as $n) {
    $stack->push($n);
}
echo "top: ", $stack->top(), "\n";
echo "pop: ", $stack->pop(), "\n";
echo "size: ", count($stack), "\n";

$queue = new SplQueue();
$queue->enqueue('a');
$queue->enqueue('b');
$queue->enqueue('c');
echo "dequeue: ", $queue->dequeue(), "\n";
foreach ($queue as $item) {
    echo "queued: $item\n";
}

$pq = new SplPriorityQueue();
$pq->insert('low', 1);
$pq->insert('high', 10);
$pq->insert('medium', 5);
while (!$pq->isEmpty()) {
    echo "priority order: ", $pq->extract(), "\n";
}

$heap = new SplMinHeap();
foreach ([5, 1, 8, 3] as $n) {
    $heap->insert($n);
}
echo implode(' ', iterator_to_array($heap, false)), "\n";

$fixed = new SplFixedArray(3);
$fixed[0] = 'x';
echo "fixed size: ", $fixed->getSize(), "\n";
