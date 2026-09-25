use strict;
use warnings;

sub abbreviate {
    my $p = shift;
    return uc join '', map { substr $_, 0, 1 } $p =~ /([A-Za-z][A-Za-z']*)/g;
}

print abbreviate('Portable Network Graphics'), "\n";
print abbreviate('Complementary metal-oxide semiconductor'), "\n";
