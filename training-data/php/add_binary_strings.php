<?php
function addBinary(string $a, string $b): string {
    $i = strlen($a) - 1;
    $j = strlen($b) - 1;
    $carry = 0;
    $out = '';
    while ($i >= 0 || $j >= 0 || $carry) {
        $sum = $carry;
        if ($i >= 0) $sum += (int)$a[$i--];
        if ($j >= 0) $sum += (int)$b[$j--];
        $out = ($sum % 2) . $out;
        $carry = intdiv($sum, 2);
    }
    return $out;
}

echo addBinary("1010", "1011"), "\n"; // 10101
