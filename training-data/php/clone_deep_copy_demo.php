<?php

class Address
{
    public function __construct(public string $city) {}
}

class Person
{
    public function __construct(public string $name, public Address $address) {}

    public function __clone()
    {
        $this->address = clone $this->address;
    }
}

$a = new Person('Ann', new Address('Oslo'));
$b = clone $a;
$b->address->city = 'Bergen';
$b->name = 'Bob';

echo "{$a->name} lives in {$a->address->city}\n";
echo "{$b->name} lives in {$b->address->city}\n";
