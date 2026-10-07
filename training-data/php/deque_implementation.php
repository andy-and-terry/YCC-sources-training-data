<?php

/** Ring-buffer deque; PHP's built-in SplDoublyLinkedList is shown for comparison. */
final class RingDeque implements Countable, IteratorAggregate
{
    private array $buf;
    private int $head = 0;
    private int $size = 0;

    public function __construct(int $capacity = 4)
    {
        $this->buf = array_fill(0, $capacity, null);
    }

    public function count(): int
    {
        return $this->size;
    }

    private function grow(): void
    {
        if ($this->size < count($this->buf)) {
            return;
        }
        $items = iterator_to_array($this->getIterator(), false);
        $this->buf = array_merge($items, array_fill(0, count($items), null));
        $this->head = 0;
    }

    public function pushBack(mixed $x): void
    {
        $this->grow();
        $this->buf[($this->head + $this->size++) % count($this->buf)] = $x;
    }

    public function pushFront(mixed $x): void
    {
        $this->grow();
        $this->head = ($this->head - 1 + count($this->buf)) % count($this->buf);
        $this->buf[$this->head] = $x;
        $this->size++;
    }

    public function popFront(): mixed
    {
        if ($this->size === 0) {
            throw new UnderflowException('empty deque');
        }
        $x = $this->buf[$this->head];
        $this->buf[$this->head] = null;
        $this->head = ($this->head + 1) % count($this->buf);
        $this->size--;
        return $x;
    }

    public function popBack(): mixed
    {
        if ($this->size === 0) {
            throw new UnderflowException('empty deque');
        }
        $i = ($this->head + --$this->size) % count($this->buf);
        $x = $this->buf[$i];
        $this->buf[$i] = null;
        return $x;
    }

    public function getIterator(): Generator
    {
        for ($i = 0; $i < $this->size; $i++) {
            yield $this->buf[($this->head + $i) % count($this->buf)];
        }
    }
}

$d = new RingDeque();
for ($i = 0; $i < 5; $i++) {
    $d->pushBack($i);
    $d->pushFront(-$i);
}
echo implode(' ', iterator_to_array($d, false)), PHP_EOL;
echo $d->popFront(), ' ', $d->popBack(), ' ', count($d), PHP_EOL;

$spl = new SplDoublyLinkedList();
$spl->push(1);
$spl->unshift(0);
echo 'spl: ', implode(',', iterator_to_array($spl)), PHP_EOL;
