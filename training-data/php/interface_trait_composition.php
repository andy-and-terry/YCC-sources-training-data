<?php
interface Greets { public function greet(): string; }

trait Polite {
    public function greet(): string { return "Good day, " . $this->name; }
}

class Person implements Greets {
    use Polite;
    public function __construct(private string $name) {}
}

echo (new Person("Ann"))->greet(), "\n";
