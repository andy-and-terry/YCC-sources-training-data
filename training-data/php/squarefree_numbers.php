<?php
// Squarefree numbers up to 100; expect 61.
function squarefree(int $n): bool {
    for ($d = 2; $d * $d <= $n; $d++) if ($n % ($d * $d) === 0) return false;
    return true;
}
$c = 0;
for ($n = 1; $n <= 100; $n++) if (squarefree($n)) $c++;
echo $c, PHP_EOL;
