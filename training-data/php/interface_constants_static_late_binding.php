<?php
abstract class Model {
    public static function create(): static { return new static(); }
    public function name(): string { return static::class; }
}
class User extends Model {}
class Post extends Model {}
echo User::create()->name(), ' ', Post::create()->name(), "\n";
