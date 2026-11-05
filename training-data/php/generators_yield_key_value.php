<?php
function pairs(array $a) {
    foreach ($a as $k => $v) {
        yield $k => strtoupper($v);
    }
}
foreach (pairs(['x' => 'a', 'y' => 'b']) as $k => $v) {
    echo "$k=$v\n";
}
function gen() { $r = yield 1; echo "got $r\n"; yield 2; }
$g = gen(); $g->current(); $g->send('hi');
