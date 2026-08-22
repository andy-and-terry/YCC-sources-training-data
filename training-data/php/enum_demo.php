<?php

enum Suit: string
{
    case Hearts = 'H';
    case Spades = 'S';
    case Clubs = 'C';
    case Diamonds = 'D';

    public function color(): string
    {
        return match ($this) {
            Suit::Hearts, Suit::Diamonds => 'red',
            Suit::Spades, Suit::Clubs => 'black',
        };
    }
}

foreach (Suit::cases() as $suit) {
    echo "{$suit->name}: {$suit->color()}\n";
}
