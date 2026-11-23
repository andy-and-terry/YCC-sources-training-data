<?php
// n(2n^2+1)/3
function term(int $n): int
{
    return intdiv(($n * (((2 * $n) * $n) + 1)), 3);
}

for ($n = 1; $n <= 15; $n++) {
    printf("%2d -> %d\n", $n, term($n));
}
