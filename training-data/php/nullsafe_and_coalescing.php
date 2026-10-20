<?php
class Addr { public ?string $city = null; }
class User { public ?Addr $addr = null; }

$u = new User;
echo $u->addr?->city ?? 'unknown', PHP_EOL;
$u->addr = new Addr;
$u->addr->city = 'Oslo';
echo $u->addr?->city, PHP_EOL;
$cfg = ['a' => ['b' => null]];
$cfg['a']['b'] ??= 'default';
echo $cfg['a']['b'], PHP_EOL;
echo $cfg['x']['y'] ?? 'missing', PHP_EOL;
