<?php
// Aliquot sequence: replace n by the sum of its proper divisors.
function aliquotSum(int $n): int {
    $s = 0;
    for ($d = 1; $d <= intdiv($n, 2); $d++) {
        if ($n % $d === 0) $s += $d;
    }
    return $s;
}

$seq = [12];
while (end($seq) > 1 && count($seq) < 20) {
    $seq[] = aliquotSum(end($seq));
}
echo implode(" ", $seq), "\n";
