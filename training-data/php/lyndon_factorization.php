<?php
function duval(string $s): array {
    $out = [];
    $n = strlen($s); $i = 0;
    while ($i < $n) {
        $j = $i + 1; $k = $i;
        while ($j < $n && $s[$k] <= $s[$j]) {
            $k = $s[$k] < $s[$j] ? $i : $k + 1;
            $j++;
        }
        while ($i <= $k) {
            $out[] = substr($s, $i, $j - $k);
            $i += $j - $k;
        }
    }
    return $out;
}
echo implode(' ', duval('banana')), "\n";
