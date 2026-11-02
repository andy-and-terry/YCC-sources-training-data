<?php
final class Money {
    public function __construct(public readonly int $cents, public readonly string $cur = 'USD') {}
    public function add(Money $o): static { return new static($this->cents + $o->cents, $this->cur); }
}
echo (new Money(150))->add(new Money(75))->cents, "\n";
