<?php
// Wilson's theorem primality test.
function wilson(int $n): bool {
    if ($n < 2) return false;
    $f = 1;
    for ($i = 2; $i < $n; $i++) $f = $f * $i % $n;
    return $f === $n - 1;
}
echo implode(" ", array_filter(range(2, 19), 'wilson')), "\n";
