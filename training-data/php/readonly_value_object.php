<?php
declare(strict_types=1);

final class Money
{
    public function __construct(
        public readonly int $amount,
        public readonly string $currency,
    ) {
        if ($amount < 0) throw new InvalidArgumentException('negative money');
    }

    public function add(Money $o): self
    {
        if ($o->currency !== $this->currency) throw new LogicException('currency mismatch');
        return new self($this->amount + $o->amount, $this->currency);
    }

    public function equals(Money $o): bool
    {
        return $this->amount === $o->amount && $this->currency === $o->currency;
    }

    public function __toString(): string
    {
        return sprintf('%s %.2f', $this->currency, $this->amount / 100);
    }
}

$total = (new Money(1999, 'USD'))->add(new Money(501, 'USD'));
echo $total, PHP_EOL;
var_dump($total->equals(new Money(2500, 'USD')));
try {
    $total->amount = 1;
} catch (Error $e) {
    echo get_class($e), ': ', $e->getMessage(), PHP_EOL;
}
