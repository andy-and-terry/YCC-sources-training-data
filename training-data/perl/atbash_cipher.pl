use strict;
use warnings;

sub atbash {
    my ($s) = @_;
    (my $out = $s) =~ tr/a-zA-Z/zyxwvutsrqponmlkjihgfedcbaZYXWVUTSRQPONMLKJIHGFEDCBA/;
    return $out;
}

my $enc = atbash('Hello, World!');
print "$enc | ", atbash($enc), "\n";
