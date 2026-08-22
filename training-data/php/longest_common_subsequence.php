<?php

function lcs(string $a, string $b): string
{
    $m = strlen($a);
    $n = strlen($b);
    $dp = array_fill(0, $m + 1, array_fill(0, $n + 1, ''));
    for ($i = 1; $i <= $m; $i++) {
        for ($j = 1; $j <= $n; $j++) {
            if ($a[$i - 1] === $b[$j - 1]) {
                $dp[$i][$j] = $dp[$i - 1][$j - 1] . $a[$i - 1];
            } else {
                $dp[$i][$j] = strlen($dp[$i - 1][$j]) >= strlen($dp[$i][$j - 1]) ? $dp[$i - 1][$j] : $dp[$i][$j - 1];
            }
        }
    }
    return $dp[$m][$n];
}

echo lcs('ABCBDAB', 'BDCABA') . "\n";
