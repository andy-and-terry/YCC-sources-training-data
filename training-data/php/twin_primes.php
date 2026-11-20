<?php
// Twin primes below 50 via sieve.
$s = array_fill(0, 53, true); $s[0] = $s[1] = false;
for ($i = 2; $i * $i <= 52; $i++) if ($s[$i]) for ($j = $i * $i; $j <= 52; $j += $i) $s[$j] = false;
for ($p = 2; $p <= 50; $p++) if ($s[$p] && $s[$p + 2]) echo "($p,", $p + 2, ") ";
echo "\n";
