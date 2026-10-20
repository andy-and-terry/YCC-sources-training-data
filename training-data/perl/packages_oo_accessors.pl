use strict;
use warnings;

package Animal;
sub new { my ($class, %a) = @_; return bless { name => $a{name} // 'x', sound => 'generic' }, $class }
sub name { $_[0]{name} }
sub speak { my $s = shift; sprintf "%s the %s says %s", $s->name, lc ref $s, $s->sound }
sub sound { $_[0]{sound} }

package Dog;
our @ISA = ('Animal');
sub sound { 'Woof' }

package main;
print Dog->new(name => 'Rex')->speak, "\n";
print Animal->new->speak, "\n";
print Dog->can('speak') ? "can\n" : "cannot\n";
print Dog->new->isa('Animal') ? "isa\n" : "not\n";
