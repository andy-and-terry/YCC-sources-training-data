<?php

const DIGITS = '0123456789abcdefghijklmnopqrstuvwxyz';

function toBase(int $n, int $base): string
{
    if ($base < 2 || $base > 36) {
        throw new InvalidArgumentException('base out of range');
    }
    if ($n === 0) {
        return '0';
    }
    $neg = $n < 0;
    $n = abs($n);
    $out = '';
    while ($n > 0) {
        $out = DIGITS[$n % $base] . $out;
        $n = intdiv($n, $base);
    }
    return ($neg ? '-' : '') . $out;
}

function fromBase(string $s, int $base): int
{
    $neg = str_starts_with($s, '-');
    $v = 0;
    foreach (str_split(ltrim(strtolower($s), '-')) as $ch) {
        $d = strpos(DIGITS, $ch);
        if ($d === false || $d >= $base) {
            throw new InvalidArgumentException("bad digit $ch");
        }
        $v = $v * $base + $d;
    }
    return $neg ? -$v : $v;
}

foreach ([[255, 2], [255, 16], [-1295, 36], [0, 7], [PHP_INT_MAX, 36]] as [$n, $b]) {
    $s = toBase($n, $b);
    printf("%d base %d = %s (base_convert: %s, roundtrip %s)\n", $n, $b, $s, $n >= 0 ? base_convert((string) $n, 10, $b) : 'n/a', fromBase($s, $b) === $n ? 'ok' : 'FAIL');
}
