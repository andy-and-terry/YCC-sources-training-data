package Counter;
sub TIESCALAR { my ($c, $v) = @_; return bless \$v, $c }
sub FETCH { my $s = shift; return $$s++ }
sub STORE { my ($s, $v) = @_; $$s = $v }

package main;
use strict;
use warnings;

tie my $n, 'Counter', 5;
print "$n $n $n\n";
$n = 100;
print "$n\n";
