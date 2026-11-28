use strict; use warnings;

package Stack;
sub new { bless { items => [] }, shift }
sub push { my $s = shift; push @{ $s->{items} }, @_; $s }
sub pop { pop @{ $_[0]{items} } }
sub size { scalar @{ $_[0]{items} } }

package main;
my $s = Stack->new->push(1, 2, 3);
print $s->pop, " ", $s->size, "\n";
