<?php

declare(strict_types=1);

class Product
{
    public function __construct(
        public readonly string $name,
        private float $price,
        protected int $stock = 0,
    ) {
    }

    public function withDiscount(float $percent): static
    {
        return new static($this->name, round($this->price * (1 - $percent / 100), 2), $this->stock);
    }

    public function describe(): string
    {
        return sprintf('%s: $%.2f (%d in stock)', $this->name, $this->price, $this->stock);
    }
}

$p = new Product('Lamp', 40.0, 5);
echo $p->describe() . "\n";
echo $p->withDiscount(25)->describe() . "\n";
echo $p->name . "\n";

try {
    $p->name = 'Other';
} catch (Error $e) {
    echo get_class($e) . ': ' . $e->getMessage() . "\n";
}
