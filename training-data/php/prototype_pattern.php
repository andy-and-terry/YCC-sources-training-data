<?php

// GoF Prototype pattern: new objects are produced by cloning an existing
// instance rather than calling `new`. __clone() shows the deep-copy hook
// needed whenever a property itself holds an object.

class Address
{
    public function __construct(public string $city)
    {
    }
}

class Employee
{
    public array $skills;

    public function __construct(public string $name, public Address $address, array $skills = [])
    {
        $this->skills = $skills;
    }

    public function __clone(): void
    {
        // Without this, the clone would share the same Address instance
        // as the original, so mutating one would leak into the other.
        $this->address = clone $this->address;
    }
}

$original = new Employee('Ada', new Address('London'), ['php', 'perl']);

$shallowCopy = $original;
$deepClone = clone $original;

$deepClone->name = 'Grace';
$deepClone->address->city = 'Boston';
$deepClone->skills[] = 'plsql';

echo "original: {$original->name} in {$original->address->city}, skills: " . implode(',', $original->skills) . "\n";
echo "clone:    {$deepClone->name} in {$deepClone->address->city}, skills: " . implode(',', $deepClone->skills) . "\n";
echo ($original === $shallowCopy ? 'same object' : 'different object') . "\n";
echo ($original === $deepClone ? 'same object' : 'different object') . "\n";
