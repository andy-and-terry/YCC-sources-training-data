<?php
enum Status: string {
    case Active = 'active';
    case Banned = 'banned';
    public function label(): string {
        return match($this) { self::Active => 'OK', self::Banned => 'No access' };
    }
}
echo Status::from('banned')->label(), "\n";
