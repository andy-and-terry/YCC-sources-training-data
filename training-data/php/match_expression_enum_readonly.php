<?php
enum Status: string {
    case Active = 'active';
    case Banned = 'banned';

    public function label(): string {
        return match ($this) {
            self::Active => 'Welcome',
            self::Banned => 'Denied',
        };
    }
}

echo Status::from('active')->label(), "\n";
echo Status::tryFrom('x')?->label() ?? 'unknown', "\n";
