<?php
$it = new LimitIterator(new InfiniteIterator(new ArrayIterator([1, 2, 3])), 0, 7);
echo implode(',', iterator_to_array($it, false)), PHP_EOL;
$f = new CallbackFilterIterator(new ArrayIterator(range(1, 10)), fn($v) => $v % 3 === 0);
echo implode(',', iterator_to_array($f, false)), PHP_EOL;
$r = new RecursiveIteratorIterator(new RecursiveArrayIterator([1, [2, [3, 4]], 5]));
echo implode(',', iterator_to_array($r, false)), PHP_EOL;
$m = new MultipleIterator(); $m->attachIterator(new ArrayIterator([1, 2])); $m->attachIterator(new ArrayIterator(['a', 'b']));
foreach ($m as $vals) echo implode('', $vals), ' ';
echo PHP_EOL;
