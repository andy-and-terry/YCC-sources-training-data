<?php
function reverseBits(int $value, int $width = 8): int {
    $bin = str_pad(decbin($value), $width, "0", STR_PAD_LEFT);
    return bindec(strrev($bin));
}

foreach ([1, 6, 13, 128] as $v) {
    echo "$v ", reverseBits($v), "\n"; // 128 96 176 1
}
