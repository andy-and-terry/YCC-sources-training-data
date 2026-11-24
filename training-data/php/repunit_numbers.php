<?php
// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
$r = 0;
for ($n = 1; $n <= 8; $n++) {
    $r = $r * 10 + 1;
    echo $r, ($r % 3 === 0 ? "  (divisible by 3)" : ""), "\n";
}
