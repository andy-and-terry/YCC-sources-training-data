<?php
function affine(string $s, int $a, int $b, bool $decrypt = false): string {
    $inv = 0;
    for ($x = 1; $x < 26; $x++) if ($a * $x % 26 === 1) { $inv = $x; break; }
    $out = '';
    foreach (str_split($s) as $ch) {
        if ($ch >= 'A' && $ch <= 'Z') {
            $x = ord($ch) - 65;
            $y = $decrypt ? (($inv * ($x - $b)) % 26 + 26) % 26 : ($a * $x + $b) % 26;
            $ch = chr($y + 65);
        }
        $out .= $ch;
    }
    return $out;
}

$c = affine("AFFINE", 5, 8);
echo $c, " ", affine($c, 5, 8, true), "\n";
