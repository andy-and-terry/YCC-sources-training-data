<?php
function minimumTotal(array $t): int {
    $dp = end($t);
    for ($r = count($t) - 2; $r >= 0; $r--) {
        foreach ($t[$r] as $i => $v) {
            $dp[$i] = $v + min($dp[$i], $dp[$i + 1]);
        }
    }
    return $dp[0];
}

echo minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]), "\n"; // 11
