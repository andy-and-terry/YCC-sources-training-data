use strict;
use warnings;

sub pascal {
    my @tri = ([1]);
    push @tri, [1, (map { $tri[-1][$_ - 1] + $tri[-1][$_] } 1 .. $#{ $tri[-1] }), 1] for 2 .. shift;
    return @tri;
}

my @tri = pascal(8);
my $width = length "@{ $tri[-1] }";
for my $row (@tri) {
    my $s = "@$row";
    my $pad = int(($width - length $s) / 2);
    print ' ' x $pad, $s, "\n";
}
