<?php
// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
// Native 64-bit ints cover s(0)..s(6); s(7) would overflow to float.
$s = 2;
for ($i = 0; $i < 7; $i++) {
    echo "s($i) = $s\n";
    $s = $s * $s - $s + 1;
}
