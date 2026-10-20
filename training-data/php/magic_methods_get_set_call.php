<?php
class Bag
{
    private array $d = [];
    public function __get($k) { return $this->d[$k] ?? null; }
    public function __set($k, $v) { $this->d[$k] = $v; }
    public function __isset($k) { return isset($this->d[$k]); }
    public function __unset($k) { unset($this->d[$k]); }
    public function __call($n, $a) { return $n . '(' . implode(',', $a) . ')'; }
    public static function __callStatic($n, $a) { return "static $n"; }
    public function __toString(): string { return json_encode($this->d); }
}

$b = new Bag;
$b->x = 1;
echo isset($b->x) ? 'set' : 'unset', $b->run(1, 2), Bag::go(), $b, PHP_EOL;
unset($b->x);
echo isset($b->x) ? 'set' : 'unset', PHP_EOL;
