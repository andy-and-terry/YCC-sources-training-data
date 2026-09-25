<?php

final class Complex
{
    public function __construct(public readonly float $re, public readonly float $im = 0.0)
    {
    }

    public static function polar(float $r, float $theta): self
    {
        return new self($r * cos($theta), $r * sin($theta));
    }

    public function add(self $o): self
    {
        return new self($this->re + $o->re, $this->im + $o->im);
    }

    public function sub(self $o): self
    {
        return new self($this->re - $o->re, $this->im - $o->im);
    }

    public function mul(self $o): self
    {
        return new self($this->re * $o->re - $this->im * $o->im, $this->re * $o->im + $this->im * $o->re);
    }

    public function div(self $o): self
    {
        $d = $o->re ** 2 + $o->im ** 2;
        return new self(($this->re * $o->re + $this->im * $o->im) / $d, ($this->im * $o->re - $this->re * $o->im) / $d);
    }

    public function abs(): float
    {
        return hypot($this->re, $this->im);
    }

    public function __toString(): string
    {
        return sprintf('(%.3f%+.3fi)', $this->re, $this->im);
    }
}

/** @param list<Complex> $a @return list<Complex> */
function fft(array $a): array
{
    $n = count($a);
    if ($n === 1) {
        return $a;
    }
    $even = fft(array_values(array_filter($a, fn ($k) => $k % 2 === 0, ARRAY_FILTER_USE_KEY)));
    $odd = fft(array_values(array_filter($a, fn ($k) => $k % 2 === 1, ARRAY_FILTER_USE_KEY)));
    $out = [];
    for ($k = 0; $k < $n / 2; $k++) {
        $t = Complex::polar(1, -2 * M_PI * $k / $n)->mul($odd[$k]);
        $out[$k] = $even[$k]->add($t);
        $out[$k + $n / 2] = $even[$k]->sub($t);
    }
    ksort($out);
    return $out;
}

$z1 = new Complex(3, 4);
$z2 = new Complex(1, -2);
echo $z1->add($z2), ' ', $z1->mul($z2), ' ', $z1->div($z2), ' |z1|=', $z1->abs(), PHP_EOL;
echo implode(' ', fft(array_map(fn ($x) => new Complex($x), [1, 1, 1, 1, 0, 0, 0, 0]))), PHP_EOL;
