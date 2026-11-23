<?php
// n(n+1)/2+1
function term(int $n): int
{
    return intdiv(($n * ($n + 1)), 2) + 1;
}

for ($n = 1; $n <= 15; $n++) {
    printf("%2d -> %d\n", $n, term($n));
}
