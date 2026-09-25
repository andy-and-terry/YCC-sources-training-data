<?php

function newtonSqrt(float $x, float $eps = 1e-12): float
{
    if ($x < 0) {
        throw new InvalidArgumentException('negative input');
    }
    if ($x === 0.0) {
        return 0.0;
    }
    $g = $x > 1 ? $x / 2 : 1.0;
    while (abs($g * $g - $x) > $eps * $x) {
        $g = ($g + $x / $g) / 2;
    }
    return $g;
}

function newtonRoot(callable $f, callable $df, float $x0, int $maxIter = 50): float
{
    for ($i = 0; $i < $maxIter; $i++) {
        $step = $f($x0) / $df($x0);
        $x0 -= $step;
        if (abs($step) < 1e-15) {
            break;
        }
    }
    return $x0;
}

foreach ([2, 9, 0.25, 1e10] as $x) {
    printf("sqrt(%g) = %.12f (builtin %.12f)\n", $x, newtonSqrt($x), sqrt($x));
}
printf("root of cos(x) - x: %.15f\n", newtonRoot(fn ($x) => cos($x) - $x, fn ($x) => -sin($x) - 1, 1.0));
