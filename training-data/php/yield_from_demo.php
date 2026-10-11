<?php

function inner(): Generator
{
    yield 1;
    yield 2;
    return 'inner-done';
}

function outer(): Generator
{
    yield 0;
    $result = yield from inner();
    yield from [3, 4];
    yield 5;
    return $result;
}

$g = outer();
foreach ($g as $k => $v) {
    echo "$k=>$v ";
}
echo "\n" . $g->getReturn() . "\n";
