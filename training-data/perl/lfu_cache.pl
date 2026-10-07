use strict;
use warnings;

package LfuCache;

sub new {
    my ($class, $capacity) = @_;
    return bless { capacity => $capacity, values => {}, freqs => {} }, $class;
}

sub _evict {
    my ($self) = @_;
    my ($min_key) = sort { $self->{freqs}{$a} <=> $self->{freqs}{$b} } keys %{ $self->{freqs} };
    delete $self->{values}{$min_key};
    delete $self->{freqs}{$min_key};
}

sub put {
    my ($self, $key, $value) = @_;
    return if $self->{capacity} <= 0;
    if (exists $self->{values}{$key}) {
        $self->{values}{$key} = $value;
        $self->{freqs}{$key}++;
        return;
    }
    $self->_evict() if scalar(keys %{ $self->{values} }) >= $self->{capacity};
    $self->{values}{$key} = $value;
    $self->{freqs}{$key} = 1;
}

sub get {
    my ($self, $key) = @_;
    return -1 unless exists $self->{values}{$key};
    $self->{freqs}{$key}++;
    return $self->{values}{$key};
}

package main;

my $cache = LfuCache->new(2);
$cache->put(1, 10);
$cache->put(2, 20);
$cache->get(1);
$cache->put(3, 30);
print $cache->get(2), "\n";
print $cache->get(1), "\n";
print $cache->get(3), "\n";
