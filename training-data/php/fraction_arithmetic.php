<?php

final class Fraction implements Stringable
{
    public readonly int $num;
    public readonly int $den;

    public function __construct(int $num, int $den = 1)
    {
        if ($den === 0) {
            throw new DivisionByZeroError('zero denominator');
        }
        if ($den < 0) {
            [$num, $den] = [-$num, -$den];
        }
        $g = self::gcd(abs($num), $den) ?: 1;
        $this->num = intdiv($num, $g);
        $this->den = intdiv($den, $g);
    }

    private static function gcd(int $a, int $b): int
    {
        return $b === 0 ? $a : self::gcd($b, $a % $b);
    }

    public function add(self $o): self
    {
        return new self($this->num * $o->den + $o->num * $this->den, $this->den * $o->den);
    }

    public function sub(self $o): self
    {
        return new self($this->num * $o->den - $o->num * $this->den, $this->den * $o->den);
    }

    public function mul(self $o): self
    {
        return new self($this->num * $o->num, $this->den * $o->den);
    }

    public function div(self $o): self
    {
        return new self($this->num * $o->den, $this->den * $o->num);
    }

    public function compare(self $o): int
    {
        return $this->num * $o->den <=> $o->num * $this->den;
    }

    public function __toString(): string
    {
        return $this->den === 1 ? (string) $this->num : "{$this->num}/{$this->den}";
    }
}

$a = new Fraction(1, 3);
$b = new Fraction(1, 6);
echo "{$a->add($b)} {$a->sub($b)} {$a->mul($b)} {$a->div($b)} cmp={$a->compare($b)}", PHP_EOL;
$h = array_reduce(range(1, 20), fn ($acc, $k) => $acc->add(new Fraction(1, $k)), new Fraction(0));
echo "H(20) = $h", PHP_EOL;
$list = [new Fraction(3, 4), new Fraction(-1, 2), new Fraction(2, 3)];
usort($list, fn ($x, $y) => $x->compare($y));
echo implode(' < ', $list), PHP_EOL;
