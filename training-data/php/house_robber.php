<?php

function houseRobber(array $houses): int
{
    $prev = 0;
    $curr = 0;
    foreach ($houses as $h) {
        $next = max($curr, $prev + $h);
        $prev = $curr;
        $curr = $next;
    }
    return $curr;
}

echo houseRobber([2, 7, 9, 3, 1]) . "\n";
