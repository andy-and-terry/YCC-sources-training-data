<?php

function countAndSay(int $n): string
{
    $s = '1';
    for ($k = 1; $k < $n; $k++) {
        $s = preg_replace_callback('/(\d)\1*/', fn ($m) => strlen($m[0]) . $m[1], $s);
    }
    return $s;
}

for ($i = 1; $i <= 10; $i++) {
    printf("%2d %s\n", $i, countAndSay($i));
}
