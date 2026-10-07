<?php

class DoublyNode
{
    public ?DoublyNode $next = null;
    public ?DoublyNode $prev = null;

    public function __construct(public int $value)
    {
    }
}

class DoublyLinkedList
{
    private ?DoublyNode $head = null;
    private ?DoublyNode $tail = null;

    public function pushBack(int $value): void
    {
        $node = new DoublyNode($value);
        if ($this->tail === null) {
            $this->head = $this->tail = $node;
            return;
        }
        $node->prev = $this->tail;
        $this->tail->next = $node;
        $this->tail = $node;
    }

    public function pushFront(int $value): void
    {
        $node = new DoublyNode($value);
        if ($this->head === null) {
            $this->head = $this->tail = $node;
            return;
        }
        $node->next = $this->head;
        $this->head->prev = $node;
        $this->head = $node;
    }

    public function popBack(): ?int
    {
        if ($this->tail === null) {
            return null;
        }
        $value = $this->tail->value;
        $this->tail = $this->tail->prev;
        if ($this->tail === null) {
            $this->head = null;
        } else {
            $this->tail->next = null;
        }
        return $value;
    }

    public function toArrayForward(): array
    {
        $out = [];
        for ($cur = $this->head; $cur !== null; $cur = $cur->next) {
            $out[] = $cur->value;
        }
        return $out;
    }

    public function toArrayBackward(): array
    {
        $out = [];
        for ($cur = $this->tail; $cur !== null; $cur = $cur->prev) {
            $out[] = $cur->value;
        }
        return $out;
    }
}

$list = new DoublyLinkedList();
$list->pushBack(2);
$list->pushBack(3);
$list->pushFront(1);
echo implode(',', $list->toArrayForward()) . "\n";
echo implode(',', $list->toArrayBackward()) . "\n";
$list->popBack();
echo implode(',', $list->toArrayForward()) . "\n";
