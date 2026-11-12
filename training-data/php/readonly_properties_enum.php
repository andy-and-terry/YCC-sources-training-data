<?php
enum Suit: string {
    case Hearts = 'H';
    case Spades = 'S';
    public function label(): string { return ucfirst(strtolower($this->name)); }
}
final class Card {
    public function __construct(public readonly Suit $suit, public readonly int $rank) {}
}
$c = new Card(Suit::from('S'), 12);
echo $c->suit->label(), " ", $c->rank, "\n";
var_dump(Suit::tryFrom('X'));
