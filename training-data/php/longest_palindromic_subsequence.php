<?php

function lps(string $s): string
{
    $n = strlen($s);
    if ($n === 0) {
        return '';
    }
    $dp = array_fill(0, $n, array_fill(0, $n, 0));
    for ($i = $n - 1; $i >= 0; $i--) {
        $dp[$i][$i] = 1;
        for ($j = $i + 1; $j < $n; $j++) {
            $inner = $i + 1 <= $j - 1 ? $dp[$i + 1][$j - 1] : 0;
            $dp[$i][$j] = $s[$i] === $s[$j] ? $inner + 2 : max($dp[$i + 1][$j], $dp[$i][$j - 1]);
        }
    }
    [$left, $right, $i, $j] = ['', '', 0, $n - 1];
    while ($i <= $j) {
        if ($i === $j) {
            $left .= $s[$i];
            break;
        }
        if ($s[$i] === $s[$j]) {
            $left .= $s[$i++];
            $right = $s[$j--] . $right;
        } elseif ($dp[$i + 1][$j] >= $dp[$i][$j - 1]) {
            $i++;
        } else {
            $j--;
        }
    }
    return $left . $right;
}

foreach (['bbbab', 'character', 'agbdba', 'cbbd'] as $s) {
    echo "$s -> ", lps($s), PHP_EOL;
}
