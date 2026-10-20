<?php
final class Money {
    public function __construct(
        public readonly int $amount,
        public readonly string $currency = 'USD',
    ) {}

    public function add(Money $o): static {
        return new static($this->amount + $o->amount, $this->currency);
    }
}

$m = (new Money(500))->add(new Money(250));
echo "{$m->amount} {$m->currency}\n";
