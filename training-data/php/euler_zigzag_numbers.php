<?php
// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
$row = [1];
$out = [1];
for ($i = 0; $i < 9; $i++) {
    $next = [0];
    foreach (array_reverse($row) as $x) $next[] = end($next) + $x;
    $row = $next;
    $out[] = end($row);
}
echo implode(" ", $out), "\n";
