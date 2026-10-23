<?php
declare(strict_types=1);

function farey(int $n): array
{
    $terms = ['0/1'];
    [$a, $b, $c, $d] = [0, 1, 1, $n];
    while ($c <= $n) {
        $terms[] = "$c/$d";
        $k = intdiv($n + $b, $d);
        [$a, $b, $c, $d] = [$c, $d, $k * $c - $a, $k * $d - $b];
    }
    return $terms;
}

echo implode(' ', farey(5)), PHP_EOL;
