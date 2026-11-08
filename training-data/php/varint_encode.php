<?php
function varint(int $n): array {
    $out = [];
    while ($n >= 0x80) {
        $out[] = ($n & 0x7F) | 0x80;
        $n >>= 7;
    }
    $out[] = $n;
    return $out;
}

echo implode(' ', array_map(fn($b) => sprintf('%02x', $b), varint(300))), "\n";
