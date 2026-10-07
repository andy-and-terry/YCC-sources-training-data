<?php

interface FileSystemNode
{
    public function size(): int;
    public function describe(string $indent = ''): string;
}

class FileNode implements FileSystemNode
{
    public function __construct(private string $name, private int $sizeBytes)
    {
    }

    public function size(): int
    {
        return $this->sizeBytes;
    }

    public function describe(string $indent = ''): string
    {
        return "{$indent}{$this->name} ({$this->sizeBytes}b)\n";
    }
}

class DirectoryNode implements FileSystemNode
{
    /** @var FileSystemNode[] */
    private array $children = [];

    public function __construct(private string $name)
    {
    }

    public function add(FileSystemNode $child): void
    {
        $this->children[] = $child;
    }

    public function size(): int
    {
        return array_sum(array_map(fn (FileSystemNode $c) => $c->size(), $this->children));
    }

    public function describe(string $indent = ''): string
    {
        $out = "{$indent}{$this->name}/\n";
        foreach ($this->children as $child) {
            $out .= $child->describe($indent . '  ');
        }
        return $out;
    }
}

$root = new DirectoryNode('root');
$root->add(new FileNode('readme.txt', 120));

$src = new DirectoryNode('src');
$src->add(new FileNode('main.php', 340));
$src->add(new FileNode('utils.php', 210));
$root->add($src);

echo $root->describe();
echo "total size: {$root->size()} bytes\n";
