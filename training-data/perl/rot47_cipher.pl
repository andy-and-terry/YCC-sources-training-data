use strict;
use warnings;

sub rot47 { my $s = shift; $s =~ tr/!-~/P-~!-O/; return $s }

my $e = rot47("Hello, World!");
print "$e ", rot47($e), "\n";
