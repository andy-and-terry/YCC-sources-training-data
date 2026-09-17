<?php

function wordBreak(string $s, array $dictionary): bool
{
    $wordSet = array_flip($dictionary);
    $n = strlen($s);
    $dp = array_fill(0, $n + 1, false);
    $dp[0] = true;

    for ($i = 1; $i <= $n; $i++) {
        for ($j = 0; $j < $i; $j++) {
            if ($dp[$j] && isset($wordSet[substr($s, $j, $i - $j)])) {
                $dp[$i] = true;
                break;
            }
        }
    }
    return $dp[$n];
}

$dictionary = ['leet', 'code', 'cats', 'and', 'sand', 'dog'];
var_dump(wordBreak('leetcode', $dictionary));
var_dump(wordBreak('catsanddog', $dictionary));
var_dump(wordBreak('catsandwolf', $dictionary));
