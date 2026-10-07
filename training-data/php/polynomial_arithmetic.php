<?php

/** Coefficients stored lowest degree first. */
final class Polynomial
{
    public readonly array $c;

    public function __construct(array $coeffs)
    {
        while (count($coeffs) > 1 && end($coeffs) == 0) {
            array_pop($coeffs);
        }
        $this->c = $coeffs ?: [0];
    }

    public function add(Polynomial $o): self
    {
        $n = max(count($this->c), count($o->c));
        $r = [];
        for ($i = 0; $i < $n; $i++) {
            $r[] = ($this->c[$i] ?? 0) + ($o->c[$i] ?? 0);
        }
        return new self($r);
    }

    public function mul(Polynomial $o): self
    {
        $r = array_fill(0, count($this->c) + count($o->c) - 1, 0);
        foreach ($this->c as $i => $a) {
            foreach ($o->c as $j => $b) {
                $r[$i + $j] += $a * $b;
            }
        }
        return new self($r);
    }

    public function evaluate(float $x): float
    {
        return array_reduce(array_reverse($this->c), fn ($acc, $k) => $acc * $x + $k, 0.0);
    }

    public function derivative(): self
    {
        $r = [];
        for ($i = 1; $i < count($this->c); $i++) {
            $r[] = $i * $this->c[$i];
        }
        return new self($r);
    }

    public function __toString(): string
    {
        $terms = [];
        for ($i = count($this->c) - 1; $i >= 0; $i--) {
            $k = $this->c[$i];
            if ($k == 0 && count($this->c) > 1) {
                continue;
            }
            $coef = ($i > 0 && abs($k) == 1) ? ($k < 0 ? '-' : '') : (string) $k;
            $terms[] = $coef . ($i === 0 ? '' : ($i === 1 ? 'x' : "x^$i"));
        }
        return str_replace('+ -', '- ', implode(' + ', $terms));
    }
}

$p = new Polynomial([1, -3, 2]);  // 2x^2 - 3x + 1
$q = new Polynomial([-1, 1]);     // x - 1
echo "p = $p\nq = $q\n";
echo 'p + q = ', $p->add($q), PHP_EOL;
echo 'p * q = ', $p->mul($q), PHP_EOL;
echo "p' = ", $p->derivative(), PHP_EOL;
echo 'p(3) = ', $p->evaluate(3), PHP_EOL;
