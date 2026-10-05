<?php

class Playlist implements IteratorAggregate, Countable
{
    private array $songs = [];

    public function add(string $song): static
    {
        $this->songs[] = $song;
        return $this;
    }

    public function getIterator(): Generator
    {
        foreach ($this->songs as $i => $song) {
            yield $i + 1 => $song;
        }
    }

    public function count(): int
    {
        return count($this->songs);
    }
}

$p = (new Playlist())->add('Intro')->add('Verse')->add('Outro');
foreach ($p as $n => $song) {
    echo "$n. $song\n";
}
echo count($p), " tracks\n";
print_r(iterator_to_array($p));
