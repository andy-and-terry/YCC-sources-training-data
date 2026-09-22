use strict;
use warnings;

package Subject;

sub new {
    my ($class) = @_;
    return bless { observers => [] }, $class;
}

sub subscribe {
    my ($self, $callback) = @_;
    push @{ $self->{observers} }, $callback;
}

sub notify {
    my ($self, @args) = @_;
    $_->(@args) for @{ $self->{observers} };
}

package main;

my $ticker = Subject->new;
$ticker->subscribe(sub { my $price = shift; print "logger: price is $price\n"; });
$ticker->subscribe(sub { my $price = shift; print "alert: price is $price\n" if $price > 100; });

$ticker->notify(95);
$ticker->notify(120);
