use strict;
use warnings;

our $level = 1;
sub show { print "level=$level\n" }
sub nested { local $level = $level + 1; show(); }
show();
nested();
show();
my $x = 10;
{ my $x = 20; print "inner $x\n"; }
print "outer $x\n";
