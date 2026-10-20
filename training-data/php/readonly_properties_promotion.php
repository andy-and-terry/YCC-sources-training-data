<?php
declare(strict_types=1);

final class Money
{
    public function __construct(public readonly int $cents, public readonly string $cur = 'USD') {}

    public function add(Money $o): static
    {
        return new static($this->cents + $o->cents, $this->cur);
    }
}

$m = (new Money(150))->add(new Money(275));
echo $m->cents, ' ', $m->cur, PHP_EOL;
try {
    $m->cents = 1;
} catch (Error $e) {
    echo get_class($e), PHP_EOL;
}
