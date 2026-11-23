<?php
// n^2(n+1)/2
function term(int $n): int
{
    return intdiv((($n * $n) * ($n + 1)), 2);
}

for ($n = 1; $n <= 15; $n++) {
    printf("%2d -> %d\n", $n, term($n));
}
