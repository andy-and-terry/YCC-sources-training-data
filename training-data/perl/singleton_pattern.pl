use strict;
use warnings;

package Config;

my $instance;

sub instance {
    my ($class) = @_;
    $instance //= bless { settings => {} }, $class;
    return $instance;
}

sub set {
    my ($self, $key, $value) = @_;
    $self->{settings}{$key} = $value;
}

sub get {
    my ($self, $key) = @_;
    return $self->{settings}{$key};
}

package main;

my $a = Config->instance;
$a->set('env', 'production');

my $b = Config->instance;
print $b->get('env'), "\n";
print(($a == $b) ? "same instance\n" : "different instance\n");
