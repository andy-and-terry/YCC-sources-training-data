<?php
$n = 8;
for ($r = 0; $r < $n; $r++) {
    echo str_repeat(' ', $n - $r - 1);
    for ($c = 0; $c <= $r; $c++) echo (($r & $c) === $c) ? '* ' : '  ';
    echo "\n";
}
