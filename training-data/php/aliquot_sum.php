<?php
// Aliquot sum with match expression.
function aliquot(int $n): int { $s = 0; for ($d = 1; $d < $n; $d++) if ($n % $d === 0) $s += $d; return $s; }
foreach ([6, 12, 15, 28] as $n) {
    $a = aliquot($n);
    echo "$n $a ", match (true) { $a === $n => "perfect", $a > $n => "abundant", default => "deficient" }, "\n";
}
