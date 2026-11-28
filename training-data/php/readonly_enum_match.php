<?php
enum Status: string {
    case Active = 'active';
    case Banned = 'banned';

    public function label(): string {
        return match ($this) {
            self::Active => 'OK',
            self::Banned => 'Blocked',
        };
    }
}

echo Status::from('banned')->label(), PHP_EOL;
echo Status::tryFrom('x')?->label() ?? 'unknown', PHP_EOL;
