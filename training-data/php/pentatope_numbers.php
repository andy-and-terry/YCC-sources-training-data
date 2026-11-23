<?php
// n(n+1)(n+2)(n+3)/24
function term(int $n): int
{
    return intdiv(((($n * ($n + 1)) * ($n + 2)) * ($n + 3)), 24);
}

for ($n = 1; $n <= 15; $n++) {
    printf("%2d -> %d\n", $n, term($n));
}
