<?php
// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
function fact(int $n): int { return $n <= 1 ? 1 : $n * fact($n - 1); }
function comb(int $n, int $k): int { return intdiv(fact($n), fact($k) * fact($n - $k)); }
$n = 5;
$row = [];
for ($k = 1; $k <= $n; $k++) $row[] = intdiv(comb($n - 1, $k - 1) * fact($n), fact($k));
echo implode(" ", $row), "\n";
