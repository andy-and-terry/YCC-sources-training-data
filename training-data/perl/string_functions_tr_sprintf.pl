use strict;
use warnings;

my $s = "Hello, World";
(my $rot13 = $s) =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "$rot13\n";
my $vowels = ($s =~ tr/aeiouAEIOU//);
print "vowels=$vowels\n";
print lc($s), " ", uc($s), " ", ucfirst(lc("PERL")), " ", length($s), "\n";
print join("|", split(/,\s*/, $s)), " ", index($s, "World"), " ", scalar reverse($s), "\n";
print "ab" x 3, " ", join(",", (1) x 3), "\n";
