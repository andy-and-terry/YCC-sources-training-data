<?php

class Money implements Stringable
{
    public function __construct(private int $cents, private string $currency = 'USD') {}

    public function __toString(): string
    {
        return sprintf('%s %d.%02d', $this->currency, intdiv($this->cents, 100), $this->cents % 100);
    }
}

function show(Stringable|string $s): void
{
    echo "-> $s\n";
}

$m = new Money(1999);
show($m);
show('plain');
echo strlen((string) $m), "\n";
var_dump($m instanceof Stringable);
