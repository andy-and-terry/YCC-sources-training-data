<?php

class Formatter
{
    private string $prefix = '>> ';

    private function wrap(string $s): string
    {
        return $this->prefix . $s;
    }

    public function exposed(): Closure
    {
        return Closure::fromCallable([$this, 'wrap']);
    }
}

$fn = (new Formatter())->exposed();
echo $fn('hidden method') . "\n";

$upper = Closure::fromCallable('strtoupper');
echo implode(',', array_map($upper, ['a', 'b'])) . "\n";
