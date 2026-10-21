<?php
// P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
function pell(int $count): Generator {
    [$a, $b] = [0, 1];
    for ($i = 0; $i < $count; $i++) {
        yield $a;
        [$a, $b] = [$b, 2 * $b + $a];
    }
}

foreach (pell(15) as $i => $p) {
    echo "P($i) = $p\n";
}
