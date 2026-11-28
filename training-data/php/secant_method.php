<?php
function secant(callable $f, float $x0, float $x1): float {
    for ($i = 0; $i < 50; $i++) {
        $f0 = $f($x0);
        $f1 = $f($x1);
        if ($f1 == $f0) break;
        [$x0, $x1] = [$x1, $x1 - $f1 * ($x1 - $x0) / ($f1 - $f0)];
        if (abs($x1 - $x0) < 1e-12) break;
    }
    return $x1;
}

printf("%.10f\n", secant(fn($x) => $x * $x - 2, 1, 2));
