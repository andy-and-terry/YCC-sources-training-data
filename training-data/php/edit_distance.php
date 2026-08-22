<?php

function editDistance(string $a, string $b): int
{
    $m = strlen($a);
    $n = strlen($b);
    $dp = array_fill(0, $m + 1, array_fill(0, $n + 1, 0));
    for ($i = 0; $i <= $m; $i++) {
        $dp[$i][0] = $i;
    }
    for ($j = 0; $j <= $n; $j++) {
        $dp[0][$j] = $j;
    }
    for ($i = 1; $i <= $m; $i++) {
        for ($j = 1; $j <= $n; $j++) {
            if ($a[$i - 1] === $b[$j - 1]) {
                $dp[$i][$j] = $dp[$i - 1][$j - 1];
            } else {
                $dp[$i][$j] = 1 + min($dp[$i - 1][$j], $dp[$i][$j - 1], $dp[$i - 1][$j - 1]);
            }
        }
    }
    return $dp[$m][$n];
}

echo editDistance('kitten', 'sitting') . "\n";
