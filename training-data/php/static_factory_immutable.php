<?php
final class Money {
    private function __construct(public readonly int $cents) {}
    public static function dollars(float $d): self { return new self((int) round($d * 100)); }
    public function plus(Money $o): self { return new self($this->cents + $o->cents); }
}

echo Money::dollars(1.5)->plus(Money::dollars(2.25))->cents, PHP_EOL;
