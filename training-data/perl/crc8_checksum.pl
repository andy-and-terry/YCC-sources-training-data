use strict;
use warnings;

sub crc8 {
    my $crc = 0;
    for my $b (unpack "C*", shift) {
        $crc ^= $b;
        for (1 .. 8) { $crc = ($crc & 0x80) ? (($crc << 1) ^ 0x07) & 0xFF : ($crc << 1) & 0xFF }
    }
    return $crc;
}

printf "%02x\n", crc8("123456789");
