<?php

class Pizza
{
    public array $toppings = [];
    public string $size = 'medium';

    public function __toString(): string
    {
        return $this->size . ' pizza with ' . (empty($this->toppings) ? 'no toppings' : implode(', ', $this->toppings));
    }
}

class PizzaBuilder
{
    private Pizza $pizza;

    public function __construct()
    {
        $this->pizza = new Pizza();
    }

    public function setSize(string $size): static
    {
        $this->pizza->size = $size;
        return $this;
    }

    public function addTopping(string $topping): static
    {
        $this->pizza->toppings[] = $topping;
        return $this;
    }

    public function build(): Pizza
    {
        return $this->pizza;
    }
}

$pizza = (new PizzaBuilder())
    ->setSize('large')
    ->addTopping('cheese')
    ->addTopping('mushroom')
    ->build();

echo $pizza . "\n";
