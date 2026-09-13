<?php

interface DiscountStrategy
{
    public function apply(float $amount): float;
}

class NoDiscount implements DiscountStrategy
{
    public function apply(float $amount): float
    {
        return $amount;
    }
}

class PercentageDiscount implements DiscountStrategy
{
    public function __construct(private float $percent)
    {
    }

    public function apply(float $amount): float
    {
        return $amount * (1 - $this->percent / 100);
    }
}

class FlatDiscount implements DiscountStrategy
{
    public function __construct(private float $flat)
    {
    }

    public function apply(float $amount): float
    {
        return max(0, $amount - $this->flat);
    }
}

class Checkout
{
    public function __construct(private DiscountStrategy $strategy)
    {
    }

    public function total(float $amount): float
    {
        return $this->strategy->apply($amount);
    }
}

$checkouts = [
    new Checkout(new NoDiscount()),
    new Checkout(new PercentageDiscount(10)),
    new Checkout(new FlatDiscount(5)),
];

foreach ($checkouts as $checkout) {
    echo $checkout->total(100) . "\n";
}
