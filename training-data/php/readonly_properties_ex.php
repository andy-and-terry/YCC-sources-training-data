<?php
final class Money {
    public function __construct(public readonly int $amount, public readonly string $currency) {}
    public function add(Money $o): static { return new static($this->amount + $o->amount, $this->currency); }
}
$m = (new Money(5, "USD"))->add(new Money(7, "USD"));
echo $m->amount, " ", $m->currency, "\n";
try { $m->amount = 1; } catch (Error $e) { echo get_class($e), "\n"; }
