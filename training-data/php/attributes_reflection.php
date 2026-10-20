<?php
#[Attribute(Attribute::TARGET_METHOD)]
class Route { public function __construct(public string $path, public string $method = 'GET') {} }

class Ctl
{
    #[Route('/home')] public function home() {}
    #[Route('/save', method: 'POST')] public function save() {}
    public function helper() {}
}

foreach ((new ReflectionClass(Ctl::class))->getMethods() as $m) {
    foreach ($m->getAttributes(Route::class) as $a) {
        $r = $a->newInstance();
        echo "{$r->method} {$r->path} -> {$m->getName()}", PHP_EOL;
    }
}
