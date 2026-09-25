<?php

final class ListNode
{
    public function __construct(public int $val, public ?ListNode $next = null)
    {
    }
}

function fromArray(array $a): ?ListNode
{
    $head = null;
    foreach (array_reverse($a) as $v) {
        $head = new ListNode($v, $head);
    }
    return $head;
}

function toArray(?ListNode $n): array
{
    $out = [];
    for (; $n !== null; $n = $n->next) {
        $out[] = $n->val;
    }
    return $out;
}

function merge(?ListNode $a, ?ListNode $b): ?ListNode
{
    $dummy = new ListNode(0);
    $tail = $dummy;
    while ($a !== null && $b !== null) {
        if ($a->val <= $b->val) {
            $tail->next = $a;
            $a = $a->next;
        } else {
            $tail->next = $b;
            $b = $b->next;
        }
        $tail = $tail->next;
    }
    $tail->next = $a ?? $b;
    return $dummy->next;
}

echo implode(' ', toArray(merge(fromArray([1, 2, 4, 9]), fromArray([1, 3, 4, 5, 10])))), PHP_EOL;
