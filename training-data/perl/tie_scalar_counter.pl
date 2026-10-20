use strict;
use warnings;

package Counter;
sub TIESCALAR { my ($c, $start) = @_; my $v = $start; bless \$v, $c }
sub FETCH { my $s = shift; $$s++ }
sub STORE { my ($s, $v) = @_; $$s = $v }

package UCHash;
require Tie::Hash;
our @ISA = ('Tie::StdHash');
sub STORE { $_[0]{uc $_[1]} = $_[2] }

package main;
tie my $c, 'Counter', 5;
print "$c $c $c\n";
$c = 100; print "$c\n";
tie my %h, 'UCHash';
$h{abc} = 1; $h{Def} = 2;
print join(",", sort keys %h), "\n";
