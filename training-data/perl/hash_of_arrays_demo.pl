use strict;
use warnings;

my %by_length;
for my $word (qw(apple fig kiwi pear plum banana date)) {
    push @{ $by_length{ length $word } }, $word;
}

for my $len (sort { $a <=> $b } keys %by_length) {
    printf "%d: %s\n", $len, join(", ", @{ $by_length{$len} });
}

my %inverted = map { $_ => scalar @{ $by_length{$_} } } keys %by_length;
print join(" ", map { "$_=$inverted{$_}" } sort keys %inverted), "\n";
print "exists 9? ", (exists $by_length{9} ? "yes" : "no"), "\n";
delete $by_length{3};
print "keys left: ", join(",", sort keys %by_length), "\n";
