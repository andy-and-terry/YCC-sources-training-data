<?php

class BloomFilter
{
    private array $bits;

    public function __construct(private int $size)
    {
        $this->bits = array_fill(0, $size, false);
    }

    private function hash1(string $s): int
    {
        $h = 0;
        foreach (str_split($s) as $c) {
            $h = ($h * 31 + ord($c)) % $this->size;
        }
        return $h;
    }

    private function hash2(string $s): int
    {
        $h = 0;
        foreach (str_split($s) as $c) {
            $h = ($h * 17 + ord($c) + 7) % $this->size;
        }
        return $h;
    }

    public function add(string $value): void
    {
        $this->bits[$this->hash1($value)] = true;
        $this->bits[$this->hash2($value)] = true;
    }

    public function mightContain(string $value): bool
    {
        return $this->bits[$this->hash1($value)] && $this->bits[$this->hash2($value)];
    }
}

$bf = new BloomFilter(64);
$bf->add('apple');
$bf->add('banana');
var_dump($bf->mightContain('apple'));
var_dump($bf->mightContain('cherry'));
