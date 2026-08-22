<?php

class ListNode
{
    public ?ListNode $next = null;

    public function __construct(public int $value)
    {
    }
}

class LinkedList
{
    private ?ListNode $head = null;

    public function push(int $value): void
    {
        $node = new ListNode($value);
        if ($this->head === null) {
            $this->head = $node;
            return;
        }
        $cur = $this->head;
        while ($cur->next !== null) {
            $cur = $cur->next;
        }
        $cur->next = $node;
    }

    public function reverse(): void
    {
        $prev = null;
        $cur = $this->head;
        while ($cur !== null) {
            $next = $cur->next;
            $cur->next = $prev;
            $prev = $cur;
            $cur = $next;
        }
        $this->head = $prev;
    }

    public function toArray(): array
    {
        $out = [];
        $cur = $this->head;
        while ($cur !== null) {
            $out[] = $cur->value;
            $cur = $cur->next;
        }
        return $out;
    }
}

$list = new LinkedList();
foreach ([1, 2, 3, 4] as $v) {
    $list->push($v);
}
$list->reverse();
echo implode(',', $list->toArray()) . "\n";
