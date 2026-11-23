<?php
// 3n(n-1)+1
function term(int $n): int
{
    return ((3 * $n) * ($n - 1)) + 1;
}

for ($n = 1; $n <= 15; $n++) {
    printf("%2d -> %d\n", $n, term($n));
}
