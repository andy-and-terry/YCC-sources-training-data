<?php

$queue = new SplPriorityQueue();
$queue->setExtractFlags(SplPriorityQueue::EXTR_BOTH);

$queue->insert('write tests', 2);
$queue->insert('fix outage', 10);
$queue->insert('refactor', 1);
$queue->insert('review PR', 5);

while (!$queue->isEmpty()) {
    $item = $queue->extract();
    echo "{$item['priority']}: {$item['data']}\n";
}
