use strict;
use warnings;

my $text = "Hello, World";
(my $upper = $text) =~ tr/a-z/A-Z/;
print "$upper\n";

my $vowels = ($text =~ tr/aeiouAEIOU//);
print "vowels: $vowels\n";

(my $squeezed = "aabbccdd") =~ tr/a-z//s;
print "$squeezed\n";

(my $digits = "tel: 555-1234") =~ tr/0-9//cd;
print "$digits\n";

my $rot13 = "Hello";
$rot13 =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "$rot13\n";

my $renamed = $text =~ tr/lo/01/r;
print "$renamed\n";
