<?php

enum Suit: string
{
    case Hearts = 'H';
    case Spades = 'S';

    public function label(): string
    {
        return ucfirst(strtolower($this->name));
    }

    public static function fromChar(string $c): self
    {
        return self::from($c);
    }
}

echo Suit::Hearts->value . "\n";
echo Suit::fromChar('S')->label() . "\n";
var_dump(Suit::tryFrom('X'));
echo count(Suit::cases()) . "\n";
