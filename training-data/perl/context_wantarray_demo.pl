use strict;
use warnings;

sub context_aware {
    return wantarray ? (1, 2, 3) : "scalar";
}

my @list = context_aware();
my $scalar = context_aware();
print "@list\n";
print "$scalar\n";
