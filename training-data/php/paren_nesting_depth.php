<?php
// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
function maxDepth(string $s): int {
    $depth = $best = 0;
    foreach (str_split($s) as $ch) {
        if ($ch === '(') {
            $best = max($best, ++$depth);
        } elseif ($ch === ')' && --$depth < 0) {
            return -1;
        }
    }
    return $depth === 0 ? $best : -1;
}

echo maxDepth('(1+(2*(3)))'), " ", maxDepth('(()'), "\n";
