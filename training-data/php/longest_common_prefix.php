<?php

function longestCommonPrefix(array $words): string
{
    if ($words === []) {
        return '';
    }
    sort($words, SORT_STRING);
    [$lo, $hi] = [reset($words), end($words)];
    $i = 0;
    while ($i < strlen($lo) && $lo[$i] === $hi[$i]) {
        $i++;
    }
    return substr($lo, 0, $i);
}

foreach ([['flower', 'flow', 'flight'], ['dog', 'racecar', 'car'], ['interspecies', 'interstellar', 'interstate']] as $w) {
    echo json_encode(longestCommonPrefix($w)), PHP_EOL;
}
