<?php

class Address
{
    public function __construct(public ?string $city = null) {}
}

class User
{
    public function __construct(public ?Address $address = null) {}
}

$u = new User(new Address('Paris'));
$n = new User();
echo ($u->address?->city ?? 'none') . "\n";
echo ($n->address?->city ?? 'none') . "\n";

function sum(int ...$nums): int
{
    return array_sum($nums);
}
$args = [1, 2, 3];
echo sum(...$args, ...[4, 5]) . "\n";
$merged = [...['a' => 1], ...['b' => 2]];
echo json_encode($merged) . "\n";
