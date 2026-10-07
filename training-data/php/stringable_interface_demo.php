<?php

class Money implements Stringable
{
    public function __construct(private int $cents, private string $currency = 'USD')
    {
    }

    public function __toString(): string
    {
        return sprintf('%s %d.%02d', $this->currency, intdiv($this->cents, 100), $this->cents % 100);
    }
}

function show(string|Stringable $value): void
{
    echo 'value: ' . $value . "\n";
}

$m = new Money(12345);
echo $m . "\n";
show($m);
show('plain text');
echo ($m instanceof Stringable ? 'is' : 'is not') . " Stringable\n";
echo strlen((string) $m) . "\n";
echo str_contains((string) new Money(5), '0.05') ? "found\n" : "missing\n";
