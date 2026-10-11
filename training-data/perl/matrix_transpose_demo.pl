use strict;
use warnings;

my @m = ([1, 2, 3], [4, 5, 6]);

my @t;
for my $r (0 .. $#m) {
    for my $c (0 .. $#{ $m[$r] }) {
        $t[$c][$r] = $m[$r][$c];
    }
}

print join(" ", @$_), "\n" for @t;

my @t2 = map { my $c = $_; [ map { $_->[$c] } @m ] } 0 .. $#{ $m[0] };
print "same: ", (join(",", map { @$_ } @t) eq join(",", map { @$_ } @t2) ? "yes" : "no"), "\n";
