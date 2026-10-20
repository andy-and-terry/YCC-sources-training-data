use strict;
use warnings;

sub ctx { return wantarray ? "list" : defined(wantarray) ? "scalar" : "void" }
my @l = ctx();
my $s = ctx();
print "$l[0] $s\n";
sub minmax { my @s = sort { $a <=> $b } @_; return wantarray ? ($s[0], $s[-1]) : "$s[0]-$s[-1]" }
my ($lo, $hi) = minmax(5, 2, 9);
my $range = minmax(5, 2, 9);
print "$lo $hi $range\n";
my $count = () = "a,b,c" =~ /,/g;
print "$count\n";
