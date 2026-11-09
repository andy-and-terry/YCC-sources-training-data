<?php
class Model {
    public static function create(): static { return new static(); }
    public function name(): string { return static::class; }
}
class User extends Model {}
echo User::create()->name(), "\n";
