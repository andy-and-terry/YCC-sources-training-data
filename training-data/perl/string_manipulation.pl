use strict;
use warnings;

my $s = "Hello, Perl World!";
print uc($s), "\n";
print lc($s), "\n";
print length($s), "\n";
print join("|", split(/ /, $s)), "\n";
(my $replaced = $s) =~ s/World/Programming/;
print "$replaced\n";
