#!/usr/bin/perl
use strict;
use warnings;

my %by_letter;
for my $word (qw(apple avocado banana blueberry cherry apricot)) {
    push @{ $by_letter{ substr($word, 0, 1) } }, $word;
}

for my $letter (sort keys %by_letter) {
    my @words = @{ $by_letter{$letter} };
    printf "%s (%d): %s\n", $letter, scalar @words, join(", ", @words);
}

push @{ $by_letter{d} }, 'date';
print "exists d: ", (exists $by_letter{d} ? "yes" : "no"), "\n";
print "first a-word: $by_letter{a}[0]\n";
print "last b-word: $by_letter{b}->[-1]\n";

delete $by_letter{c};
print "keys: ", join(",", sort keys %by_letter), "\n";
