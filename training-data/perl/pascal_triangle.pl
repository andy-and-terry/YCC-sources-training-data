use strict;
use warnings;

my @row = (1);
for my $i (1 .. 6) {
    print join(" ", @row), "\n";
    @row = (1, (map { $row[$_ - 1] + $row[$_] } 1 .. $#row), 1);
}
