<?php
function ordinal(int $n): string {
    $suffix = match (true) {
        $n % 100 >= 11 && $n % 100 <= 13 => "th",
        $n % 10 === 1 => "st",
        $n % 10 === 2 => "nd",
        $n % 10 === 3 => "rd",
        default => "th",
    };
    return $n . $suffix;
}

echo implode(" ", array_map('ordinal', [1, 2, 3, 4, 11, 12, 13, 21, 101, 111])), "\n";
