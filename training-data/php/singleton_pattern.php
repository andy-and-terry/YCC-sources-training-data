<?php

class Singleton
{
    private static ?Singleton $instance = null;
    public int $value;

    private function __construct(int $value)
    {
        $this->value = $value;
    }

    public static function getInstance(int $value): Singleton
    {
        if (self::$instance === null) {
            self::$instance = new self($value);
        }
        return self::$instance;
    }
}

$a = Singleton::getInstance(1);
$b = Singleton::getInstance(2);
var_dump($a === $b, $a->value, $b->value);
