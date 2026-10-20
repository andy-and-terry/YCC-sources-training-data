<?php
class Container
{
    private array $bindings = [];
    public function bind(string $id, Closure $f): void { $this->bindings[$id] = $f; }
    public function get(string $id): mixed
    {
        if (isset($this->bindings[$id])) return ($this->bindings[$id])($this);
        $r = new ReflectionClass($id);
        $ctor = $r->getConstructor();
        if (!$ctor) return new $id;
        $deps = array_map(fn($p) => $this->get($p->getType()->getName()), $ctor->getParameters());
        return $r->newInstanceArgs($deps);
    }
}
class Logger { public function log($m) { echo "LOG $m", PHP_EOL; } }
class Mailer { public function __construct(public Logger $l) {} }

$m = (new Container)->get(Mailer::class);
$m->l->log('autowired');
