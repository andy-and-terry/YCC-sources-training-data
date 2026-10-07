use strict;
use warnings;

my @rows = (['Alice', 92.5], ['Bob', 78.333], ['Carol', 100]);

printf "%-10s %6s\n", 'Name', 'Score';
for my $row (@rows) {
    my ($name, $score) = @$row;
    printf "%-10s %6.2f\n", $name, $score;
}

my $padded = sprintf("%05d", 42);
print "padded: $padded\n";

printf "hex: %x octal: %o literal percent: 100%%\n", 255, 8;
