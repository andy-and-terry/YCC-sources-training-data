<?php

trait Greetable
{
    public function greeting(): string
    {
        return "Hello, {$this->getName()}!";
    }
}

class Person
{
    use Greetable;

    public function __construct(private string $name)
    {
    }

    public function getName(): string
    {
        return $this->name;
    }
}

$p = new Person('Alice');
echo $p->greeting() . "\n";
