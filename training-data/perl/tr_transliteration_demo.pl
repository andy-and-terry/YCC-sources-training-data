#!/usr/bin/perl
use strict;
use warnings;

my $text = "Hello, World";

(my $upper = $text) =~ tr/a-z/A-Z/;
print "$upper\n";

my $vowels = ($text =~ tr/aeiouAEIOU//);
print "vowels: $vowels\n";

(my $rot13 = $text) =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "rot13: $rot13\n";

(my $squeezed = "aabbccdd") =~ tr/a-z//s;
print "squeezed: $squeezed\n";

(my $no_digits = "a1b22c333") =~ tr/0-9//d;
print "no digits: $no_digits\n";

my $copy = $text =~ tr/a-z/*/r;
print "masked: $copy\n";
