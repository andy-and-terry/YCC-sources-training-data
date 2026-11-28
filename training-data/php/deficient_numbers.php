<?php
function sigma(int $n): int {
    $s = 0;
    for ($d = 1; $d <= $n; $d++) if ($n % $d === 0) $s += $d;
    return $s;
}

echo implode(' ', array_filter(range(1, 20), fn($n) => sigma($n) < 2 * $n)), "\n";
