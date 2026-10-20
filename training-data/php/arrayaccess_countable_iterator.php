<?php
class Coll implements ArrayAccess, Countable, IteratorAggregate
{
    private array $items = [];
    public function offsetExists(mixed $o): bool { return isset($this->items[$o]); }
    public function offsetGet(mixed $o): mixed { return $this->items[$o] ?? null; }
    public function offsetSet(mixed $o, mixed $v): void { $o === null ? $this->items[] = $v : $this->items[$o] = $v; }
    public function offsetUnset(mixed $o): void { unset($this->items[$o]); }
    public function count(): int { return count($this->items); }
    public function getIterator(): Iterator { return new ArrayIterator($this->items); }
}

$c = new Coll;
$c[] = 'a';
$c['k'] = 'b';
unset($c[0]);
echo count($c), $c['k'], PHP_EOL;
foreach ($c as $k => $v) echo "$k=$v ";
echo PHP_EOL;
