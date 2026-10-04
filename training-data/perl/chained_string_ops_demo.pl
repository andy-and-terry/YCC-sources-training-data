#!/usr/bin/perl
use strict;
use warnings;

my $s = "  The Quick  Brown Fox  ";

(my $trimmed = $s) =~ s/^\s+|\s+$//g;
print "[$trimmed]\n";

(my $single = $trimmed) =~ s/\s+/ /g;
print "[$single]\n";

print lc($single), "\n";
print uc($single), "\n";
print ucfirst(lc("hELLO")), "\n";
print lcfirst("ABC"), "\n";
print scalar reverse($single), "\n";

print index($single, "Quick"), " ", rindex($single, "o"), "\n";
print substr($single, 4, 5), "\n";

substr($single, 0, 3) = "A";
print "$single\n";
print join("|", split / /, $single), "\n";
print "chars: ", length($single), "\n";
