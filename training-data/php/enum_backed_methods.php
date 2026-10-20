<?php
// PHP 8.1 backed enum with methods, constants and from/tryFrom.
enum Suit: string {
    case Hearts = 'H';
    case Spades = 'S';

    const Wild = self::Spades;

    public function color(): string {
        return match ($this) {
            self::Hearts => 'Red',
            self::Spades => 'Black',
        };
    }

    public static function fromChar(string $c): ?self {
        return self::tryFrom($c);
    }
}

echo Suit::from('H')->color(), "\n";
var_dump(Suit::fromChar('X'));
echo Suit::Wild->name, " ", count(Suit::cases()), "\n";
