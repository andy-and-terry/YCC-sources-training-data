<?php

function addStrings(string $a, string $b): string
{
    $i = strlen($a) - 1;
    $j = strlen($b) - 1;
    $carry = 0;
    $out = '';
    while ($i >= 0 || $j >= 0 || $carry) {
        $s = $carry + ($i >= 0 ? (int) $a[$i--] : 0) + ($j >= 0 ? (int) $b[$j--] : 0);
        $out = ($s % 10) . $out;
        $carry = intdiv($s, 10);
    }
    return $out;
}

function multiplyStrings(string $a, string $b): string
{
    $res = array_fill(0, strlen($a) + strlen($b), 0);
    for ($i = strlen($a) - 1; $i >= 0; $i--) {
        for ($j = strlen($b) - 1; $j >= 0; $j--) {
            $p = (int) $a[$i] * (int) $b[$j] + $res[$i + $j + 1];
            $res[$i + $j + 1] = $p % 10;
            $res[$i + $j] += intdiv($p, 10);
        }
    }
    $s = ltrim(implode('', $res), '0');
    return $s === '' ? '0' : $s;
}

echo addStrings('99999999999999999999', '1'), PHP_EOL;
$f = '1';
for ($k = 2; $k <= 40; $k++) {
    $f = multiplyStrings($f, (string) $k);
}
echo "40! = $f", PHP_EOL;
