use strict; use warnings;
sub ctx { return wantarray ? "list" : defined(wantarray) ? "scalar" : "void" }
my @l = ctx();
my $s = ctx();
print "$l[0] $s\n";
