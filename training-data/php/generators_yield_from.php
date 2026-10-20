<?php
function inner() { yield 1; yield 2; return 'done'; }
function outer() {
    $r = yield from inner();
    yield 3;
    return $r;
}

$g = outer();
foreach ($g as $v) echo $v, ' ';
echo $g->getReturn(), "\n";
