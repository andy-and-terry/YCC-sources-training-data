# Collapse consecutive duplicate characters with a regex.
use strict; use warnings;
(my $s = "aabbbcdd") =~ s/(.)\1+/$1/g;
print "$s\n";
