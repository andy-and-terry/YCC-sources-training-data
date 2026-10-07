use strict;
use warnings;

sub hamming {
    my ($a, $b) = @_;
    die "strands must be of equal length\n" unless length $a == length $b;
    return ($a ^ $b) =~ tr/\0//c;
}

print hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"), "\n";
eval { hamming("AB", "A") };
print "error: $@" if $@;
