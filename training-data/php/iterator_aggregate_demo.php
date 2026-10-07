<?php

class Playlist implements IteratorAggregate, Countable
{
    private array $tracks = [];

    public function add(string $title): static
    {
        $this->tracks[] = $title;
        return $this;
    }

    public function getIterator(): Generator
    {
        foreach ($this->tracks as $i => $t) {
            yield $i + 1 => $t;
        }
    }

    public function count(): int
    {
        return count($this->tracks);
    }
}

$p = (new Playlist())->add('Intro')->add('Verse')->add('Outro');
foreach ($p as $n => $title) {
    echo "$n. $title\n";
}
echo count($p), " tracks\n";
echo implode(' | ', iterator_to_array($p)), "\n";
