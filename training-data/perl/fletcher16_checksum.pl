use strict;
use warnings;

sub fletcher16 {
    my ($data) = @_;
    my ($s1, $s2) = (0, 0);
    for my $b (unpack 'C*', $data) {
        $s1 = ($s1 + $b) % 255;
        $s2 = ($s2 + $s1) % 255;
    }
    return ($s2 << 8) | $s1;
}

printf "%x\n", fletcher16("abcde");
