<?php
function counter(int $n) { for ($i = 1; $i <= $n; $i++) yield $i; return 'done'; }
function outer() { $r = yield from counter(3); yield 99; return $r; }

foreach (outer() as $k => $v) echo "$v ";
echo PHP_EOL;

function logger() { while (true) { $m = yield; echo "log: $m", PHP_EOL; } }
$l = logger();
$l->current();
$l->send('first');
$l->send('second');

$g = counter(2);
foreach ($g as $_) {}
echo $g->getReturn(), PHP_EOL;
