use strict;
use warnings;

sub is_isogram {
    my %seen;
    for my $c ((lc shift) =~ /[a-z]/g) {
        return 0 if $seen{$c}++;
    }
    return 1;
}

print "$_ ", is_isogram($_), "\n" for qw(lumberjacks background six-year-old isograms);
