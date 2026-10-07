<?php

function longestValid(string $s): int
{
    $stack = [-1];
    $best = 0;
    for ($i = 0; $i < strlen($s); $i++) {
        if ($s[$i] === '(') {
            $stack[] = $i;
            continue;
        }
        array_pop($stack);
        if ($stack === []) {
            $stack[] = $i;
        } else {
            $best = max($best, $i - end($stack));
        }
    }
    return $best;
}

foreach (['(()', ')()())', '', '()(()', '((()))()'] as $s) {
    echo json_encode($s), ' ', longestValid($s), PHP_EOL;
}
