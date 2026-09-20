<?php

class DListNode
{
    public ?DListNode $prev = null;
    public ?DListNode $next = null;

    public function __construct(public int $value)
    {
    }
}

class DoublyLinkedList
{
    private ?DListNode $head = null;
    private ?DListNode $tail = null;

    public function addLast(int $value): void
    {
        $node = new DListNode($value);
        if ($this->head === null) {
            $this->head = $node;
            $this->tail = $node;
            return;
        }
        $node->prev = $this->tail;
        $this->tail->next = $node;
        $this->tail = $node;
    }

    public function removeFirst(): void
    {
        if ($this->head === null) {
            return;
        }
        $this->head = $this->head->next;
        if ($this->head !== null) {
            $this->head->prev = null;
        } else {
            $this->tail = null;
        }
    }

    public function toArrayForward(): array
    {
        $out = [];
        $cur = $this->head;
        while ($cur !== null) {
            $out[] = $cur->value;
            $cur = $cur->next;
        }
        return $out;
    }

    public function toArrayBackward(): array
    {
        $out = [];
        $cur = $this->tail;
        while ($cur !== null) {
            $out[] = $cur->value;
            $cur = $cur->prev;
        }
        return $out;
    }
}

$list = new DoublyLinkedList();
foreach ([1, 2, 3, 4] as $v) {
    $list->addLast($v);
}
echo implode(',', $list->toArrayForward()) . "\n";
$list->removeFirst();
echo implode(',', $list->toArrayBackward()) . "\n";
