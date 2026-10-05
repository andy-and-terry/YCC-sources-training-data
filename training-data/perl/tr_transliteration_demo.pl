use strict;
use warnings;

my $text = "Hello, World";
(my $upper = $text) =~ tr/a-z/A-Z/;
print "$upper\n";

my $vowels = ($text =~ tr/aeiouAEIOU//);
print "vowels: $vowels\n";

(my $rot13 = $text) =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "rot13: $rot13\n";

(my $squeezed = "aaabbbccc") =~ tr/a-z//s;
print "squeezed: $squeezed\n";

(my $digits_only = "a1b2c3") =~ tr/0-9//cd;
print "digits: $digits_only\n";
