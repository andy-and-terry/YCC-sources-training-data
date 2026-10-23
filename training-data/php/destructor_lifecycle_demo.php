<?php

declare(strict_types=1);

class Resource
{
    public function __construct(private string $name)
    {
        echo "open {$this->name}\n";
    }

    public function __destruct()
    {
        echo "close {$this->name}\n";
    }
}

function scoped(): void
{
    $r = new Resource('scoped');
    echo "using scoped\n";
}

scoped();
echo "after scoped\n";

$a = new Resource('a');
$b = $a;
unset($a);
echo "a unset, b still holds it\n";
$b = null;
echo "b released\n";

$c = new Resource('c');
echo "end of script\n";
