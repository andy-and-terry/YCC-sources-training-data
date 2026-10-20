<?php
class Address { public function __construct(public ?string $city = null) {} }
class Customer { public function __construct(public ?Address $address = null) {} }

$c = new Customer();
var_dump($c?->address?->city);            // null, no error
$c2 = new Customer(new Address('Oslo'));
echo $c2?->address?->city ?? 'none', "\n";

function box(int $w, int $h, string $label = 'box'): string { return "$label {$w}x{$h}"; }
echo box(h: 2, w: 3), "\n";
$args = ['label' => 'crate', 'w' => 5, 'h' => 6];
echo box(...$args), "\n";
function total(int ...$n): int { return array_sum($n); }
echo total(...[1, 2, 3]), "\n";
