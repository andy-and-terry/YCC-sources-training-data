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
        foreach ($this->tracks as $i => $title) {
            yield $i + 1 => $title;
        }
    }

    public function count(): int
    {
        return count($this->tracks);
    }
}

$list = (new Playlist())->add('Intro')->add('Verse')->add('Outro');
foreach ($list as $pos => $title) {
    echo "$pos. $title\n";
}
echo count($list) . " tracks\n";
echo implode(' | ', iterator_to_array($list)) . "\n";
