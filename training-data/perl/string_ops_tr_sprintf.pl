use strict; use warnings;
my $s = "Hello World";
(my $t = $s) =~ tr/a-zA-Z//cd;
my $vowels = ($s =~ tr/aeiouAEIOU//);
print "$t $vowels ", lc(reverse $s), " ", sprintf("%05.1f", 3.14159), "\n";
