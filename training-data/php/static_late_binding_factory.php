<?php
// `static` resolves to the called class (late static binding), unlike `self`.
class Model {
    public static function create(): static { return new static(); }
    public static function table(): string { return strtolower(static::class) . 's'; }
}
class User extends Model {}
class Post extends Model {}

echo get_class(User::create()), " ", User::table(), " ", Post::table(), "\n";
