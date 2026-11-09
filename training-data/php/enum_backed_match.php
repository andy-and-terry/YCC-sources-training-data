<?php
enum Status: string {
    case Active = 'active';
    case Banned = 'banned';

    public function label(): string {
        return match($this) {
            self::Active => 'Active user',
            self::Banned => 'Banned user',
        };
    }
}
echo Status::from('banned')->label(), "\n";
