<?php

class Model
{
    public static function create(): static
    {
        return new static();
    }

    public function describe(): string
    {
        return 'a ' . static::class;
    }
}

class User extends Model
{
}

class Product extends Model
{
    public function describe(): string
    {
        return 'a special ' . parent::describe();
    }
}

foreach ([Model::create(), User::create(), Product::create()] as $instance) {
    echo $instance->describe() . "\n";
}
