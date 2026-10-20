<?php
abstract class Model
{
    protected static array $registry = [];
    public static function create(): static { $o = new static; static::$registry[] = static::class; return $o; }
    public static function registry(): array { return self::$registry; }
    public function name(): string { return static::class; }
}
class User extends Model {}
class Post extends Model {}

User::create();
echo Post::create()->name(), implode(',', Model::registry()), PHP_EOL;
