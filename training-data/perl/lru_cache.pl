use strict;
use warnings;

package LRUCache;

sub new {
    my ($class, $capacity) = @_;
    return bless { capacity => $capacity, map => {}, order => [] }, $class;
}

sub get {
    my ($self, $key) = @_;
    return undef unless exists $self->{map}{$key};
    @{$self->{order}} = grep { $_ != $key } @{$self->{order}};
    push @{$self->{order}}, $key;
    return $self->{map}{$key};
}

sub put {
    my ($self, $key, $value) = @_;
    @{$self->{order}} = grep { $_ != $key } @{$self->{order}} if exists $self->{map}{$key};
    $self->{map}{$key} = $value;
    push @{$self->{order}}, $key;
    if (@{$self->{order}} > $self->{capacity}) {
        my $evict = shift @{$self->{order}};
        delete $self->{map}{$evict};
    }
}

package main;

my $cache = LRUCache->new(2);
$cache->put(1, 1);
$cache->put(2, 2);
print $cache->get(1), "\n";
$cache->put(3, 3);
print defined($cache->get(2)) ? $cache->get(2) : "undef", "\n";
