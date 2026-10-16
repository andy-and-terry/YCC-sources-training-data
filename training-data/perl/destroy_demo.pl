use strict;
use warnings;

package Resource;

sub new {
    my ($class, $name) = @_;
    print "acquire $name\n";
    return bless { name => $name }, $class;
}

sub DESTROY {
    my $self = shift;
    print "release $self->{name}\n";
}

package main;

{
    my $a = Resource->new("A");
    print "inside scope\n";
}
print "after scope\n";

my $b = Resource->new("B");
undef $b;
print "after undef\n";

my $c = Resource->new("C");
my $d = $c;
undef $c;
print "still referenced by d\n";
undef $d;
print "end\n";
