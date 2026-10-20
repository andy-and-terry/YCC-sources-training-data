<?php
trait Timestamps {
    abstract public function id(): int;
    public function stamp(): string { return "#{$this->id()}@2024"; }
}

class Post { use Timestamps; public function id(): int { return 7; } }
echo (new Post)->stamp(), "\n";
