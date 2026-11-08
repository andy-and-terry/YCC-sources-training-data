<?php
function crc8(string $data): int {
    $crc = 0;
    foreach (unpack('C*', $data) as $b) {
        $crc ^= $b;
        for ($i = 0; $i < 8; $i++) {
            $crc = ($crc & 0x80) ? (($crc << 1) ^ 0x07) & 0xFF : ($crc << 1) & 0xFF;
        }
    }
    return $crc;
}

printf("%02x\n", crc8("123456789"));
