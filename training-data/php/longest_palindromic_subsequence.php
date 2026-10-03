<?php

function longestPalindromicSubsequence(string $s): int
{
    $n = strlen($s);
    if ($n === 0) {
        return 0;
    }
    $dp = array_fill(0, $n, array_fill(0, $n, 0));
    for ($i = 0; $i < $n; $i++) {
        $dp[$i][$i] = 1;
    }
    for ($len = 2; $len <= $n; $len++) {
        for ($i = 0; $i <= $n - $len; $i++) {
            $j = $i + $len - 1;
            if ($s[$i] === $s[$j]) {
                $dp[$i][$j] = ($i + 1 <= $j - 1 ? $dp[$i + 1][$j - 1] : 0) + 2;
            } else {
                $dp[$i][$j] = max($dp[$i + 1][$j], $dp[$i][$j - 1]);
            }
        }
    }
    return $dp[0][$n - 1];
}

echo longestPalindromicSubsequence('bbbab') . "\n";
echo longestPalindromicSubsequence('cbbd') . "\n";
