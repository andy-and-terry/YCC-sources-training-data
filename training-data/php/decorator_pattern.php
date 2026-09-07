<?php

interface Coffee
{
    public function cost(): float;

    public function description(): string;
}

class SimpleCoffee implements Coffee
{
    public function cost(): float
    {
        return 2.0;
    }

    public function description(): string
    {
        return 'Coffee';
    }
}

abstract class CoffeeDecorator implements Coffee
{
    public function __construct(protected Coffee $coffee)
    {
    }
}

class MilkDecorator extends CoffeeDecorator
{
    public function cost(): float
    {
        return $this->coffee->cost() + 0.5;
    }

    public function description(): string
    {
        return $this->coffee->description() . ' + Milk';
    }
}

class SugarDecorator extends CoffeeDecorator
{
    public function cost(): float
    {
        return $this->coffee->cost() + 0.25;
    }

    public function description(): string
    {
        return $this->coffee->description() . ' + Sugar';
    }
}

$order = new SugarDecorator(new MilkDecorator(new SimpleCoffee()));
echo $order->description() . ': $' . $order->cost() . "\n";
