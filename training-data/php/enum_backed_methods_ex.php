<?php
enum Status: string {
    case Active = 'active';
    case Banned = 'banned';

    public function label(): string {
        return ucfirst($this->value);
    }
}
echo Status::from('active')->label(), "\n";
var_dump(Status::tryFrom('nope'));
print_r(array_map(fn($c) => $c->name, Status::cases()));
