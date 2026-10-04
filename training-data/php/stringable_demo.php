<?php

class Money implements Stringable
{
    public function __construct(private int $cents, private string $currency = 'USD') {}

    public function __toString(): string
    {
        return sprintf('%s %d.%02d', $this->currency, intdiv($this->cents, 100), $this->cents % 100);
    }
}

function show(string|Stringable $value): void
{
    echo "value: ", $value, "\n";
}

$price = new Money(1999);
echo $price, "\n";
show($price);
show('plain text');
echo "is Stringable: ", var_export($price instanceof Stringable, true), "\n";
echo "in string: Total is {$price}\n";
echo strlen((string) $price), "\n";
echo str_pad((string) new Money(5), 12, '.', STR_PAD_LEFT), "\n";

$items = [new Money(100), new Money(250), new Money(75)];
echo implode(' | ', $items), "\n";
