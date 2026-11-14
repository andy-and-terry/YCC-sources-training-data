<?php
$len = strlen(...);
echo $len('hello'), PHP_EOL;

class M { public function dbl(int $x): int { return $x * 2; } }
$f = (new M)->dbl(...);
echo implode(',', array_map($f, [1, 2, 3])), PHP_EOL;
