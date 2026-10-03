<?php

class Money implements Stringable
{
    public function __construct(private int $cents)
    {
    }

    public function __toString(): string
    {
        return sprintf('$%.2f', $this->cents / 100);
    }
}

function printPrice(string|Stringable $value): void
{
    echo "Price: $value\n";
}

$price = new Money(1999);
printPrice($price);
echo $price instanceof Stringable ? "is Stringable\n" : "not Stringable\n";
