<?php

abstract class Document
{
    /** @var string[] */
    protected array $tags = [];

    abstract public function clone(): static;

    public function addTag(string $tag): void
    {
        $this->tags[] = $tag;
    }

    public function tags(): array
    {
        return $this->tags;
    }
}

class Report extends Document
{
    public function __construct(public string $title, public array $sections = [])
    {
    }

    public function clone(): static
    {
        $copy = new static($this->title, $this->sections);
        $copy->tags = $this->tags;
        return $copy;
    }
}

$original = new Report('Q3 Summary', ['intro', 'numbers']);
$original->addTag('draft');

$copy = $original->clone();
$copy->title = 'Q3 Summary (copy)';
$copy->addTag('review');

echo "{$original->title}: " . implode(',', $original->tags()) . "\n";
echo "{$copy->title}: " . implode(',', $copy->tags()) . "\n";
