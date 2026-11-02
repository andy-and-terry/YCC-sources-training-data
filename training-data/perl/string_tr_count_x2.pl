use strict; use warnings;
my $s = "mississippi";
(my $t = $s) =~ tr/a-z/A-Z/;
my $count = ($s =~ tr/s//);
print "$t $count\n";
