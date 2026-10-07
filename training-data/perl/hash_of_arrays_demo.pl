use strict;
use warnings;

my %by_length;
push @{ $by_length{length $_} }, $_ for qw(a to be sea tree fox bird);

for my $len (sort { $a <=> $b } keys %by_length) {
    printf "%d: %s\n", $len, join(", ", @{ $by_length{$len} });
}

# Nested autovivification
my %tree;
$tree{fruit}{apple}{color} = 'red';
print join(",", sort keys %{ $tree{fruit} }), "\n";
