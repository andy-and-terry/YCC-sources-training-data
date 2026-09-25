<?php

function toGray(int $n): int
{
    return $n ^ ($n >> 1);
}

function fromGray(int $g): int
{
    $b = 0;
    for (; $g; $g >>= 1) {
        $b ^= $g;
    }
    return $b;
}

$prev = null;
for ($i = 0; $i < 16; $i++) {
    $g = toGray($i);
    $flag = $prev !== null && substr_count(decbin($g ^ $prev), '1') !== 1 ? ' !' : '';
    printf("%2d %04b %2d%s\n", $i, $g, fromGray($g), $flag);
    $prev = $g;
}
