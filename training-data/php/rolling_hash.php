<?php
$s = "abcabc"; $k = 3; $B = 31; $M = 1000003;
$pw = 1;
for ($i = 1; $i < $k; $i++) $pw = $pw * $B % $M;
$h = 0;
for ($i = 0; $i < $k; $i++) $h = ($h * $B + ord($s[$i])) % $M;
echo "0 $h\n";
for ($i = 1; $i + $k <= strlen($s); $i++) {
    $h = ($h - ord($s[$i - 1]) * $pw % $M + $M) % $M;
    $h = ($h * $B + ord($s[$i + $k - 1])) % $M;
    echo "$i $h\n";
}
