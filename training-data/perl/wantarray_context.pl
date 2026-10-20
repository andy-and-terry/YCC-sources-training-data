use strict;
use warnings;

# wantarray reports whether the caller wants a list, a scalar, or void.
sub context {
    return wantarray ? "list" : defined(wantarray) ? "scalar" : "void";
}

my @l = context();
my $s = context();
print "$l[0] $s\n";
context();
