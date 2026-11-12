use strict; use warnings;
package Animal;
sub new { my ($c, %a) = @_; bless { name => $a{name}, sound => 'generic' }, $c }
sub speak { my $s = shift; sprintf "%s says %s", $s->{name}, $s->sound }
sub sound { $_[0]{sound} }
package Dog; our @ISA = ('Animal');
sub sound { 'woof' }
package main;
print Dog->new(name => 'Rex')->speak, "\n";
