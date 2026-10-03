<?php

class Session
{
    public function __construct(public string $user)
    {
    }
}

// WeakMap lets us attach metadata to objects without extending their
// lifetime; entries vanish automatically once the key object is freed.
$lastSeen = new WeakMap();

$session = new Session('alice');
$lastSeen[$session] = time();

echo isset($lastSeen[$session]) ? "tracked\n" : "not tracked\n";
echo count($lastSeen) . "\n";

unset($session);
gc_collect_cycles();
echo count($lastSeen) . "\n";
