use strict;
use warnings;

sub gould {
    my $n = shift;
    my $ones = () = sprintf("%b", $n) =~ /1/g;
    return 2 ** $ones;
}

print join(' ', map { gould($_) } 0 .. 15), "\n";
