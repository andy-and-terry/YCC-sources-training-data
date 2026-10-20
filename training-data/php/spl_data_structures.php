<?php
$stack = new SplStack; $stack->push(1); $stack->push(2);
echo $stack->pop(), $stack->top(), PHP_EOL;
$q = new SplQueue; $q->enqueue('a'); $q->enqueue('b');
echo $q->dequeue(), count($q), PHP_EOL;
$h = new SplMinHeap; foreach ([5, 1, 3] as $x) $h->insert($x);
echo $h->extract(), $h->top(), PHP_EOL;
$pq = new SplPriorityQueue; $pq->insert('lo', 1); $pq->insert('hi', 9);
echo $pq->extract(), PHP_EOL;
$fixed = new SplFixedArray(3); $fixed[0] = 'x';
echo $fixed->getSize(), PHP_EOL;
$os = new SplObjectStorage; $o = new stdClass; $os[$o] = 'meta';
echo $os[$o], count($os), PHP_EOL;
