use strict;
use warnings;

package Singleton;

my $instance;

sub instance {
    my $class = shift;
    $instance //= bless { count => 0 }, $class;
    return $instance;
}

sub increment {
    my $self = shift;
    $self->{count}++;
    return $self->{count};
}

package main;

my $a = Singleton->instance();
my $b = Singleton->instance();
$a->increment();
$a->increment();
$b->increment();
print $a->{count}, "\n";
print(($a == $b) ? "same instance\n" : "different instance\n");
