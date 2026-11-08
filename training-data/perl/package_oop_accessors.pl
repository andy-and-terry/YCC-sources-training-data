use strict;
use warnings;

package Animal;
sub new { my ($class, %a) = @_; bless {%a}, $class }
sub name { $_[0]{name} }
sub speak { my $s = shift; sprintf "%s says %s", $s->name, $s->sound }

package Dog;
our @ISA = ('Animal');
sub sound { "woof" }

package main;
print Dog->new(name => "Rex")->speak, "\n";
