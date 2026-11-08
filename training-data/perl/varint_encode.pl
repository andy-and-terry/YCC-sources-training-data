use strict;
use warnings;

sub varint {
    my $n = shift;
    my @out;
    while ($n >= 128) { push @out, ($n & 127) | 128; $n >>= 7 }
    push @out, $n;
    return @out;
}

print join(" ", map { sprintf "%02x", $_ } varint(300)), "\n";
