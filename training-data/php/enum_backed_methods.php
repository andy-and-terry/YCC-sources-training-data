<?php
declare(strict_types=1);

enum Suit: string
{
    case Hearts = 'H';
    case Spades = 'S';

    public function color(): string
    {
        return match ($this) {
            self::Hearts => 'Red',
            self::Spades => 'Black',
        };
    }

    public static function fromChar(string $c): self
    {
        return self::from($c);
    }
}

echo Suit::fromChar('S')->color(), PHP_EOL;
echo Suit::tryFrom('X')?->color() ?? 'none', PHP_EOL;
echo count(Suit::cases()), PHP_EOL;
