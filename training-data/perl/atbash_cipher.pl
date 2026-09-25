use strict;
use warnings;

sub atbash_decode {
    (my $t = lc shift) =~ s/[^a-z0-9]//g;
    $t =~ tr/a-z/zyxwvutsrqponmlkjihgfedcba/;
    return $t;
}

sub atbash_encode {
    return join ' ', unpack '(A5)*', atbash_decode(shift);
}

my $e = atbash_encode("The quick brown fox");
print "$e -> ", atbash_decode($e), "\n";
