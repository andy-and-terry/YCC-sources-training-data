<?php

interface Animal
{
    public function speak(): string;
}

class Dog implements Animal
{
    public function speak(): string
    {
        return 'Woof';
    }
}

class Cat implements Animal
{
    public function speak(): string
    {
        return 'Meow';
    }
}

$animals = [new Dog(), new Cat()];
foreach ($animals as $animal) {
    echo $animal->speak() . "\n";
}
