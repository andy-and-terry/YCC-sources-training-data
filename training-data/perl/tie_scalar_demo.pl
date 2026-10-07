use strict;
use warnings;

package CountingScalar;
sub TIESCALAR { my ($class, $v) = @_; return bless { value => $v, reads => 0 }, $class }
sub FETCH     { my $self = shift; $self->{reads}++; return $self->{value} }
sub STORE     { my ($self, $v) = @_; $self->{value} = $v }

package main;

tie my $x, 'CountingScalar', 10;
my $sum = $x + $x;
$x = 5;
print "sum=$sum now=$x\n";
print "reads: ", tied($x)->{reads}, "\n";
untie $x;
