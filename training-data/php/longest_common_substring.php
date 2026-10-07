<?php

function longestCommonSubstring(string $a, string $b): int
{
    $n = strlen($a);
    $m = strlen($b);
    $dp = array_fill(0, $n + 1, array_fill(0, $m + 1, 0));
    $best = 0;
    for ($i = 1; $i <= $n; $i++) {
        for ($j = 1; $j <= $m; $j++) {
            if ($a[$i - 1] === $b[$j - 1]) {
                $dp[$i][$j] = $dp[$i - 1][$j - 1] + 1;
                $best = max($best, $dp[$i][$j]);
            }
        }
    }
    return $best;
}

echo longestCommonSubstring('abcdef', 'zabcz') . "\n";
echo longestCommonSubstring('abc', 'def') . "\n";
