<?php
class Model {
    public static function create(): static { return new static(); }
    public static function table(): string { return strtolower(static::class) . 's'; }
}
class User extends Model {}
class Post extends Model {}
echo get_class(User::create()), " ", User::table(), " ", Post::table(), "\n";
