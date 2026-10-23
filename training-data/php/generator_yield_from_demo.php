<?php

function inner(): Generator
{
    yield 1;
    yield 2;
    return 'inner-done';
}

function outer(): Generator
{
    $r = yield from inner();
    yield 3;
    return $r;
}

$g = outer();
foreach ($g as $k => $v) {
    echo "$k=$v\n";
}
echo $g->getReturn() . "\n";

function counter(): Generator
{
    $x = 0;
    while (true) {
        $cmd = yield $x;
        $x += $cmd ?? 1;
    }
}
$c = counter();
echo $c->current() . ' ' . $c->send(5) . ' ' . $c->send(2) . "\n";
