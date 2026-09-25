<?php

function binomial(int $n, int $k): int
{
    if ($k < 0 || $k > $n) {
        return 0;
    }
    $k = min($k, $n - $k);
    $r = 1;
    for ($i = 1; $i <= $k; $i++) {
        $r = intdiv($r * ($n - $k + $i), $i);
    }
    return $r;
}

function addDecimal(string $a, string $b): string
{
    $out = '';
    $carry = 0;
    for ($i = strlen($a) - 1, $j = strlen($b) - 1; $i >= 0 || $j >= 0 || $carry; $i--, $j--) {
        $s = $carry + ($i >= 0 ? (int) $a[$i] : 0) + ($j >= 0 ? (int) $b[$j] : 0);
        $out = ($s % 10) . $out;
        $carry = intdiv($s, 10);
    }
    return $out;
}

/** Exact nCk for large n by building Pascal's triangle with decimal-string addition. */
function binomialBig(int $n, int $k): string
{
    $row = ['1'];
    for ($i = 0; $i < $n; $i++) {
        $next = ['1'];
        for ($j = 1; $j <= $i; $j++) {
            $next[] = addDecimal($row[$j - 1], $row[$j]);
        }
        $next[] = '1';
        $row = $next;
    }
    return $row[$k];
}

echo binomial(10, 3), ' ', binomial(52, 5), ' ', binomial(60, 30), PHP_EOL;
echo 'C(100, 50) = ', binomialBig(100, 50), PHP_EOL;
