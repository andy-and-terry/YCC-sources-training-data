<?php

function modInverse(int $a, int $m): int
{
    for ($x = 0; $x < $m; $x++) {
        if ((($a % $m) * $x) % $m === 1) {
            return $x;
        }
    }
    return 0;
}

function chineseRemainder(array $remainders, array $moduli): int
{
    $prod = array_product($moduli);
    $x = 0;
    foreach ($remainders as $i => $r) {
        $pp = intdiv($prod, $moduli[$i]);
        $x += $r * $pp * modInverse($pp, $moduli[$i]);
    }
    return (($x % $prod) + $prod) % $prod;
}

// x = 2 mod 3, x = 3 mod 5, x = 2 mod 7 -> x = 23
echo chineseRemainder([2, 3, 2], [3, 5, 7]) . "\n";
