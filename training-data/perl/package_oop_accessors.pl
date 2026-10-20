use strict;
use warnings;

package Counter;
sub new   { my ($class, %args) = @_; return bless { count => $args{start} // 0 }, $class }
sub inc   { $_[0]{count}++; return $_[0] }
sub value { $_[0]{count} }

package LoudCounter;
our @ISA = ('Counter');
sub inc { my $self = shift; print "incrementing\n"; return $self->SUPER::inc() }

package main;
my $c = LoudCounter->new(start => 5);
$c->inc->inc;
print $c->value, " ", ref($c), " ", $c->isa('Counter') ? "isa" : "not", "\n";
