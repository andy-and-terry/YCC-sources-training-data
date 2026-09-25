<?php
declare(strict_types=1);

final class TextPipeline
{
    /** @var list<Closure> */
    private array $steps = [];

    public function pipe(callable $step): self
    {
        $this->steps[] = $step(...);
        return $this;
    }

    public function __invoke(string $input): string
    {
        return array_reduce($this->steps, fn($acc, $f) => $f($acc), $input);
    }
}

$slugify = (new TextPipeline())
    ->pipe(trim(...))
    ->pipe(strtolower(...))
    ->pipe(fn($s) => preg_replace('/[^a-z0-9]+/', '-', $s))
    ->pipe(fn($s) => trim($s, '-'));

echo $slugify('  Hello, World! PHP 8.1 Rocks  '), PHP_EOL;
