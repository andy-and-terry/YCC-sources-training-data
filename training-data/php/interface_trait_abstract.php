<?php
interface Greets { public function greet(): string; }

trait Names {
    private string $name = 'anon';
    public function setName(string $n): static { $this->name = $n; return $this; }
}

abstract class Base implements Greets {
    use Names;
    abstract protected function prefix(): string;
    public function greet(): string { return $this->prefix() . ', ' . $this->name; }
}

class Formal extends Base {
    protected function prefix(): string { return 'Good day'; }
}

echo (new Formal)->setName('Dr. Who')->greet(), "\n";
var_dump((new Formal) instanceof Greets);
