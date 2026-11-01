<?php
$q = new SplPriorityQueue();
$q->insert("low", 1);
$q->insert("high", 10);
$q->insert("mid", 5);
while (!$q->isEmpty()) echo $q->extract(), "\n";
