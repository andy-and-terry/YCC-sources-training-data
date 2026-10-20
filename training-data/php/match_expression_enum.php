<?php
enum Status: string {
    case Active = 'active';
    case Banned = 'banned';

    public function label(): string {
        return match ($this) {
            Status::Active => 'OK',
            Status::Banned => 'Blocked',
        };
    }
}

echo Status::from('banned')->label(), "\n";
echo Status::tryFrom('x')?->label() ?? 'unknown', "\n";
