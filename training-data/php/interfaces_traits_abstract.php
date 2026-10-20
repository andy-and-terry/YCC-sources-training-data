<?php
interface Jsonable { public function toJson(): string; }

trait Timestamps
{
    private int $created = 0;
    public function touch(int $t): void { $this->created = $t; }
    public function created(): int { return $this->created; }
}

abstract class Entity implements Jsonable
{
    abstract public function id(): int;
}

final class Post extends Entity
{
    use Timestamps;
    public function id(): int { return 7; }
    public function toJson(): string { return json_encode(['id' => $this->id(), 'at' => $this->created()]); }
}

$p = new Post;
$p->touch(1700000000);
echo $p->toJson(), PHP_EOL;
