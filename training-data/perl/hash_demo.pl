use strict;
use warnings;

my %scores = (Ada => 88, Bob => 72, Cleo => 95);

for my $name (sort keys %scores) {
    print "$name: $scores{$name}\n";
}

my $total = 0;
$total += $_ for values %scores;
print "average: ", $total / scalar(keys %scores), "\n";
