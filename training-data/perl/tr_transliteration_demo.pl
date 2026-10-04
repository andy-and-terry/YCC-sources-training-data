use strict; use warnings;

my $s = "Hello World";
(my $upper = $s) =~ tr/a-z/A-Z/;
print "$upper\n";
my $vowels = ($s =~ tr/aeiouAEIOU//);
print "vowels: $vowels\n";
(my $rot13 = $s) =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "rot13: $rot13\n";
(my $squeezed = "aaabbbccc") =~ tr/a-z//s;
print "squeezed: $squeezed\n";
