use strict;
use warnings;

sub reverse_bits {
    my ($v, $width) = @_;
    $width //= 8;
    my $bin = sprintf("%0${width}b", $v);
    return oct("0b" . reverse $bin);
}

printf "%d %d\n", $_, reverse_bits($_) for 1, 6, 13, 128;    # 128 96 176 1
