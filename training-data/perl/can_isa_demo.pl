use strict;
use warnings;

package Animal;
sub new { my ($c, %a) = @_; return bless {%a}, $c }
sub speak { return "..." }

package Dog;
our @ISA = ('Animal');
sub speak { return "Woof" }
sub fetch { return "fetching" }

package main;

my $d = Dog->new(name => "Rex");
print "isa Dog: ", ($d->isa('Dog') ? 1 : 0), "\n";
print "isa Animal: ", ($d->isa('Animal') ? 1 : 0), "\n";
print "isa Cat: ", ($d->isa('Cat') ? 1 : 0), "\n";
print "can fetch: ", ($d->can('fetch') ? "yes" : "no"), "\n";
print "can fly: ", ($d->can('fly') ? "yes" : "no"), "\n";

my $m = $d->can('speak');
print "via can: ", $d->$m(), "\n";
print "ref: ", ref($d), "\n";
print "UNIVERSAL::isa on hashref: ", (UNIVERSAL::isa({}, 'HASH') ? 1 : 0), "\n";
