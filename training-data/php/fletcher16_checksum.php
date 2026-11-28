<?php
function fletcher16(string $data): int {
    $s1 = $s2 = 0;
    foreach (unpack('C*', $data) as $b) {
        $s1 = ($s1 + $b) % 255;
        $s2 = ($s2 + $s1) % 255;
    }
    return ($s2 << 8) | $s1;
}

echo dechex(fletcher16("abcde")), "\n";
