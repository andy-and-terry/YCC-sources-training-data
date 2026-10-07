<?php

final class EditorMemento
{
    public function __construct(private readonly string $content)
    {
    }

    public function getContent(): string
    {
        return $this->content;
    }
}

class TextEditor
{
    private string $content = '';

    public function type(string $text): void
    {
        $this->content .= $text;
    }

    public function getContent(): string
    {
        return $this->content;
    }

    public function save(): EditorMemento
    {
        return new EditorMemento($this->content);
    }

    public function restore(EditorMemento $memento): void
    {
        $this->content = $memento->getContent();
    }
}

class History
{
    /** @var EditorMemento[] */
    private array $snapshots = [];

    public function push(EditorMemento $memento): void
    {
        $this->snapshots[] = $memento;
    }

    public function pop(): ?EditorMemento
    {
        return array_pop($this->snapshots);
    }
}

$editor = new TextEditor();
$history = new History();

$editor->type('Hello');
$history->push($editor->save());

$editor->type(', world');
$history->push($editor->save());

$editor->type('!!!');
echo "before undo: {$editor->getContent()}\n";

$history->pop();
$previous = $history->pop();
$editor->restore($previous);
echo "after undo: {$editor->getContent()}\n";
