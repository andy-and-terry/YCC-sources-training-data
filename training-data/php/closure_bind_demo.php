<?php

class Vault
{
    private string $secret = 'hidden-value';
    private static int $opened = 0;
}

$peek = function () {
    return $this->secret;
};

$bound = Closure::bind($peek, new Vault(), Vault::class);
echo $bound(), "\n";

$staticPeek = static fn() => ++self::$opened;
$binder = Closure::bind($staticPeek, null, Vault::class);
$binder();
echo "opened: ", $binder(), "\n";

$greet = function (string $greeting) {
    return "$greeting, {$this->name}";
};
$user = new class { public string $name = 'Ada'; };
echo $greet->call($user, 'Hello'), "\n";

$adder = fn(int $n) => fn(int $x) => $x + $n;
echo $adder(5)(10), "\n";

function counter(): Closure
{
    $n = 0;
    return function () use (&$n) {
        return ++$n;
    };
}
$c = counter();
$c();
echo "counter: ", $c(), "\n";
