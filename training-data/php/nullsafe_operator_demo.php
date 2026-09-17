<?php

class Address
{
    public function __construct(public readonly string $city)
    {
    }
}

class Profile
{
    public function __construct(public readonly ?Address $address = null)
    {
    }
}

class User
{
    public function __construct(public readonly ?Profile $profile = null)
    {
    }
}

function cityOf(User $user): ?string
{
    return $user->profile?->address?->city;
}

$withAddress = new User(new Profile(new Address('Berlin')));
$withoutAddress = new User(new Profile());
$withoutProfile = new User();

echo (cityOf($withAddress) ?? 'unknown') . "\n";
echo (cityOf($withoutAddress) ?? 'unknown') . "\n";
echo (cityOf($withoutProfile) ?? 'unknown') . "\n";
