<?php
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false;
    return true;
}

$n = 28;
for ($p = 2; $p <= intdiv($n, 2); $p++)
    if (isPrime($p) && isPrime($n - $p)) echo "$p + ", $n - $p, "\n";
