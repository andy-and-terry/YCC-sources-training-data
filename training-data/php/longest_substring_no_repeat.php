<?php

function longestUnique(string $s): string
{
    $last = [];
    [$start, $bestStart, $bestLen] = [0, 0, 0];
    for ($i = 0; $i < strlen($s); $i++) {
        $c = $s[$i];
        if (isset($last[$c]) && $last[$c] >= $start) {
            $start = $last[$c] + 1;
        }
        $last[$c] = $i;
        if ($i - $start + 1 > $bestLen) {
            [$bestStart, $bestLen] = [$start, $i - $start + 1];
        }
    }
    return substr($s, $bestStart, $bestLen);
}

foreach (['abcabcbb', 'bbbbb', 'pwwkew', 'dvdf'] as $s) {
    $r = longestUnique($s);
    echo "$s $r ", strlen($r), PHP_EOL;
}
