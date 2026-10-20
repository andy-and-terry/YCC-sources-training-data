<?php
// Generators with keys, delegation (yield from) and send().
function lines(array $rows): Generator {
    foreach ($rows as $i => $row) {
        yield "row$i" => strtoupper($row);
    }
}

function chained(): Generator {
    yield from lines(['a', 'b']);
    yield from ['x' => 'tail'];
    return 'done';
}

$g = chained();
foreach ($g as $k => $v) echo "$k=$v ";
echo $g->getReturn(), "\n";

function accumulator(): Generator {
    $sum = 0;
    while (true) $sum += yield $sum;
}
$acc = accumulator();
$acc->current();
echo $acc->send(5), " ", $acc->send(7), "\n";
