<?php
declare(strict_types=1);

class Box
{
    public int|float $n = 0;
    public ?string $label = null;
    public array $items = [];
    public function set(int|string $id): static { $this->label = (string)$id; return $this; }
}

$b = new Box;
$b->n = 2.5;
echo $b->set(7)->label, PHP_EOL;
try {
    $b->n = 'x';
} catch (TypeError $e) {
    echo 'TypeError', PHP_EOL;
}
function f(int|null $x, iterable $it = []): never { throw new Exception('never returns'); }
try { f(null); } catch (Exception $e) { echo $e->getMessage(), PHP_EOL; }
