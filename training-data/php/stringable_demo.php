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
    echo $value, "\n";
}

$m = new Money(12345);
show($m);
show('plain');
var_dump($m instanceof Stringable);
echo strlen((string) $m), "\n";
