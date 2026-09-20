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

class ImageProxy implements Image
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

$proxy = new ImageProxy('photo.png');
echo "proxy created, image not loaded yet\n";
echo $proxy->display() . "\n";
echo $proxy->display() . "\n";
