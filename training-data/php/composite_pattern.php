<?php

interface FileSystemNode
{
    public function size(): int;

    public function name(): string;
}

class FileLeaf implements FileSystemNode
{
    public function __construct(private string $name, private int $sizeBytes)
    {
    }

    public function size(): int
    {
        return $this->sizeBytes;
    }

    public function name(): string
    {
        return $this->name;
    }
}

class DirectoryComposite implements FileSystemNode
{
    private array $children = [];

    public function __construct(private string $name)
    {
    }

    public function add(FileSystemNode $node): void
    {
        $this->children[] = $node;
    }

    public function size(): int
    {
        $total = 0;
        foreach ($this->children as $child) {
            $total += $child->size();
        }
        return $total;
    }

    public function name(): string
    {
        return $this->name;
    }
}

$root = new DirectoryComposite('root');
$src = new DirectoryComposite('src');
$src->add(new FileLeaf('main.php', 120));
$src->add(new FileLeaf('utils.php', 80));
$root->add($src);
$root->add(new FileLeaf('README.md', 40));

echo "{$root->name()} total size: {$root->size()} bytes\n";
echo "{$src->name()} total size: {$src->size()} bytes\n";
