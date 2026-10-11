<?php

function nextId(): int
{
    static $id = 0;
    return ++$id;
}

echo nextId() . "\n";
echo nextId() . "\n";
echo nextId() . "\n";

class Counter
{
    public static function hit(): int
    {
        static $hits = 0;
        return ++$hits;
    }
}

Counter::hit();
echo Counter::hit() . "\n";
