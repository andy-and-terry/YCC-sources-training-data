<?php

/** Open-addressing string set with linear probing and tombstones. */
final class OpenHashSet implements Countable
{
    private const TOMBSTONE = "\0deleted\0";
    private array $slots;
    private int $size = 0;
    private int $used = 0;

    public function __construct(int $capacity = 8)
    {
        $this->slots = array_fill(0, $capacity, null);
    }

    private function index(string $key): int
    {
        return crc32($key) % count($this->slots);
    }

    private function find(string $key): ?int
    {
        $cap = count($this->slots);
        for ($i = $this->index($key), $n = 0; $n < $cap; $i = ($i + 1) % $cap, $n++) {
            if ($this->slots[$i] === null) {
                return null;
            }
            if ($this->slots[$i] === $key) {
                return $i;
            }
        }
        return null;
    }

    public function contains(string $key): bool
    {
        return $this->find($key) !== null;
    }

    public function add(string $key): bool
    {
        if ($this->contains($key)) {
            return false;
        }
        if (($this->used + 1) * 2 > count($this->slots)) {
            $live = array_filter($this->slots, fn ($s) => $s !== null && $s !== self::TOMBSTONE);
            $this->slots = array_fill(0, count($this->slots) * 2, null);
            $this->size = $this->used = 0;
            foreach ($live as $k) {
                $this->add($k);
            }
        }
        $i = $this->index($key);
        while ($this->slots[$i] !== null && $this->slots[$i] !== self::TOMBSTONE) {
            $i = ($i + 1) % count($this->slots);
        }
        if ($this->slots[$i] === null) {
            $this->used++;
        }
        $this->slots[$i] = $key;
        $this->size++;
        return true;
    }

    public function remove(string $key): bool
    {
        $i = $this->find($key);
        if ($i === null) {
            return false;
        }
        $this->slots[$i] = self::TOMBSTONE;
        $this->size--;
        return true;
    }

    public function count(): int
    {
        return $this->size;
    }
}

$set = new OpenHashSet();
foreach (explode(' ', 'the quick brown fox jumps over the lazy dog') as $w) {
    $set->add($w);
}
$set->remove('fox');
var_export([count($set), $set->contains('fox'), $set->contains('dog')]);
echo PHP_EOL;
