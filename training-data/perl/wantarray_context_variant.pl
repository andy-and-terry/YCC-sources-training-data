use strict; use warnings;

sub ctx { return wantarray ? "list" : defined(wantarray) ? "scalar" : "void" }

my @a = ctx();
my $s = ctx();
print "$a[0] $s\n";
