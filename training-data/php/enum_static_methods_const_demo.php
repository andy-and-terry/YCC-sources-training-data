<?php

enum Level: int
{
    case Low = 1;
    case Medium = 5;
    case High = 10;

    const DEFAULT = self::Medium;

    public static function fromScore(int $score): self
    {
        return match (true) {
            $score >= 8 => self::High,
            $score >= 4 => self::Medium,
            default => self::Low,
        };
    }

    public function label(): string
    {
        return ucfirst(strtolower($this->name));
    }
}

echo Level::fromScore(9)->label() . "\n";
echo Level::DEFAULT->label() . "\n";
echo (Level::tryFrom(7)?->label() ?? 'none') . "\n";
echo Level::from(1)->name . "\n";
