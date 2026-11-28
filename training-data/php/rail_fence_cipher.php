<?php
function order(int $n, int $k): array {
    $cycle = 2 * ($k - 1);
    $rail = fn($i) => ($r = $i % $cycle) < $k ? $r : $cycle - $r;
    $idx = range(0, $n - 1);
    usort($idx, fn($a, $b) => [$rail($a), $a] <=> [$rail($b), $b]);
    return $idx;
}

function encrypt(string $t, int $k): string {
    return implode('', array_map(fn($i) => $t[$i], order(strlen($t), $k)));
}

function decrypt(string $c, int $k): string {
    $out = array_fill(0, strlen($c), '');
    foreach (order(strlen($c), $k) as $pos => $i) $out[$i] = $c[$pos];
    return implode('', $out);
}

$c = encrypt("WEAREDISCOVERED", 3);
echo $c, " ", decrypt($c, 3), "\n";
