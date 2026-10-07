<?php

final class Node
{
    public ?Node $next = null;

    public function __construct(public int $value)
    {
    }
}

/** @return array{int,int}|null [start value, cycle length] */
function findCycle(?Node $head): ?array
{
    $slow = $fast = $head;
    while ($fast !== null && $fast->next !== null) {
        $slow = $slow->next;
        $fast = $fast->next->next;
        if ($slow !== $fast) {
            continue;
        }
        $len = 1;
        for ($p = $slow->next; $p !== $slow; $p = $p->next) {
            $len++;
        }
        for ($slow = $head; $slow !== $fast; $slow = $slow->next, $fast = $fast->next) {
        }
        return [$slow->value, $len];
    }
    return null;
}

function build(array $values, ?int $loopTo = null): Node
{
    $nodes = array_map(fn ($v) => new Node($v), $values);
    for ($i = 0; $i + 1 < count($nodes); $i++) {
        $nodes[$i]->next = $nodes[$i + 1];
    }
    if ($loopTo !== null) {
        end($nodes)->next = $nodes[$loopTo];
    }
    return $nodes[0];
}

var_export(findCycle(build([3, 2, 0, -4], 1)));
echo PHP_EOL;
var_export(findCycle(build([1, 2, 3])));
echo PHP_EOL;
