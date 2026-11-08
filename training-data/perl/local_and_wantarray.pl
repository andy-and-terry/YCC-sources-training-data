use strict;
use warnings;

our $level = 0;
sub show { print "level=$level\n" }
sub nested { local $level = $level + 1; show() }
nested();
show();

sub ctx { return wantarray ? "list" : defined(wantarray) ? "scalar" : "void" }
my @l = ctx();
my $s = ctx();
print "$l[0] $s\n";
