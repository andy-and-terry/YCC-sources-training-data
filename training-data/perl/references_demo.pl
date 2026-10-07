use strict;
use warnings;

my @numbers = (1, 2, 3, 4);
my $array_ref = \@numbers;
push @$array_ref, 5;
print "array: @$array_ref\n";
print "first via arrow: $array_ref->[0]\n";

my %ages = (Ada => 36, Bob => 29);
my $hash_ref = \%ages;
$hash_ref->{Cleo} = 41;
for my $name (sort keys %$hash_ref) {
    print "$name is $hash_ref->{$name}\n";
}

my $matrix = [ [1, 2], [3, 4] ];
print "matrix[1][0] = $matrix->[1][0]\n";
