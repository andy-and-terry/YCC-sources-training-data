use strict;
use warnings;

package MyErr; sub new { my ($c, %a) = @_; bless {%a}, $c } sub msg { $_[0]{msg} } sub throw { my $c = shift; die $c->new(@_) }
package main;

eval { MyErr->throw(msg => 'custom', code => 42); 1 } or do {
    my $e = $@;
    if (ref $e && $e->isa('MyErr')) { print "caught ", $e->msg, " $e->{code}\n" }
};
eval { my $x = 1 / 0; };
print "math: ", $@ =~ /division by zero/ ? "div0" : "other", "\n";
eval { die { code => 500 } }; print "hash err $@->{code}\n";
local $@;
my $ok = eval { die "plain\n"; 1 };
print "ok undefined, msg=$@" unless $ok;
$SIG{__WARN__} = sub { print "WARN: $_[0]" };
warn "careful\n";
