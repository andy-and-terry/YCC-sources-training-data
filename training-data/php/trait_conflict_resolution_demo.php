<?php

trait Hello
{
    public function say(): string { return 'Hello'; }
}

trait World
{
    public function say(): string { return 'World'; }
}

class Greeter
{
    use Hello, World {
        Hello::say insteadof World;
        World::say as protected sayWorld;
        Hello::say as public greet;
    }

    public function both(): string
    {
        return $this->say() . ' ' . $this->sayWorld();
    }
}

$g = new Greeter();
echo $g->both() . "\n";
echo $g->greet() . "\n";
