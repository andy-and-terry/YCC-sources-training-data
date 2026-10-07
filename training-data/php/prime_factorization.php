<?php

function factorize(int $n): array
{
    $factors = [];
    for ($p = 2; $p * $p <= $n; $p++) {
        while ($n % $p === 0) {
            $factors[] = $p;
            $n = intdiv($n, $p);
        }
    }
    if ($n > 1) {
        $factors[] = $n;
    }
    return $factors;
}

foreach ([360, 97, 1001] as $n) {
    echo "$n = ", implode(' * ', factorize($n)), "\n";
}
print_r(array_count_values(factorize(360)));
