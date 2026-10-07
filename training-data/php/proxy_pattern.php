<?php

interface Image
{
    public function display(): string;
}

class RealImage implements Image
{
    public function __construct(private string $filename)
    {
        $this->loadFromDisk();
    }

    private function loadFromDisk(): void
    {
        echo "loading {$this->filename} from disk\n";
    }

    public function display(): string
    {
        return "displaying {$this->filename}";
    }
}

class LazyImageProxy implements Image
{
    private ?RealImage $realImage = null;

    public function __construct(private string $filename)
    {
    }

    public function display(): string
    {
        if ($this->realImage === null) {
            $this->realImage = new RealImage($this->filename);
        }
        return $this->realImage->display();
    }
}

$image = new LazyImageProxy('photo.png');
echo "proxy created, nothing loaded yet\n";
echo $image->display() . "\n";
echo $image->display() . "\n";
