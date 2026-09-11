<?php

class Model
{
    public static function create(): static
    {
        return new static();
    }

    public function name(): string
    {
        return static::class;
    }
}

class User extends Model
{
}

class Product extends Model
{
}

echo Model::create()->name() . "\n";
echo User::create()->name() . "\n";
echo Product::create()->name() . "\n";
