<?php
// Reverse-and-add until a palindrome; count the steps.
function steps(int $n): int {
    for ($count = 0; $count < 50; $count++) {
        if ($count > 0 && (string) $n === strrev((string) $n)) return $count;
        $n += (int) strrev((string) $n);
    }
    return -1;
}

echo implode(" ", array_map('steps', [56, 57, 59, 79, 89])), "\n";
