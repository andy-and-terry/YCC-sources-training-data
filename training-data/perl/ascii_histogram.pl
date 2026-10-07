use strict;
use warnings;
use List::Util qw(max);

my %count;
$count{$_}++ for split //, 'theraininspainfallsmainlyontheplain';
my $peak  = max values %count;
my $width = 30;

for my $k (sort keys %count) {
    my $bar = int($count{$k} * $width / $peak) || 1;
    printf "%s | %s %d\n", $k, '#' x $bar, $count{$k};
}
