use strict;
use warnings;

my $s = "Hello, World";
print lc($s), "|", uc($s), "|", length($s), "\n";
print index($s, "World"), " ", substr($s, 7, 3), "\n";
print join("-", split(//, "abc")), "\n";
print scalar reverse($s), "\n";
print "ab" x 3, "\n";
(my $t = $s) =~ tr/a-z/A-Z/;
print "$t\n";
