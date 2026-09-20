<?php

$stack = new SplStack();
$stack->push(1);
$stack->push(2);
$stack->push(3);
echo "stack pop: " . $stack->pop() . "\n";

$queue = new SplQueue();
$queue->enqueue('a');
$queue->enqueue('b');
$queue->enqueue('c');
echo "queue dequeue: " . $queue->dequeue() . "\n";

$fixed = new SplFixedArray(3);
$fixed[0] = 'x';
$fixed[1] = 'y';
$fixed[2] = 'z';
echo "fixed array: " . implode(',', iterator_to_array($fixed)) . "\n";

$storage = new SplObjectStorage();
$obj1 = new stdClass();
$obj2 = new stdClass();
$storage->attach($obj1, 'first');
$storage->attach($obj2, 'second');
echo "storage count: " . count($storage) . "\n";
echo "obj1 data: " . $storage[$obj1] . "\n";

$heap = new SplMinHeap();
foreach ([5, 3, 8, 1] as $v) {
    $heap->insert($v);
}
$sorted = [];
while (!$heap->isEmpty()) {
    $sorted[] = $heap->extract();
}
echo "min-heap order: " . implode(',', $sorted) . "\n";
