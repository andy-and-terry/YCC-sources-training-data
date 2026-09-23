use strict;
use warnings;

package MinHeap;

sub new {
    my $class = shift;
    return bless { data => [] }, $class;
}

sub insert {
    my ($self, $value) = @_;
    push @{$self->{data}}, $value;
    my $i = $#{$self->{data}};
    while ($i > 0) {
        my $parent = int(($i - 1) / 2);
        last if $self->{data}[$parent] <= $self->{data}[$i];
        @{$self->{data}}[$parent, $i] = @{$self->{data}}[$i, $parent];
        $i = $parent;
    }
}

sub extract_min {
    my $self = shift;
    my $data = $self->{data};
    return undef unless @$data;
    my $min = $data->[0];
    my $last = pop @$data;
    if (@$data) {
        $data->[0] = $last;
        my $i = 0;
        while (1) {
            my ($left, $right) = (2 * $i + 1, 2 * $i + 2);
            my $smallest = $i;
            $smallest = $left if $left <= $#$data && $data->[$left] < $data->[$smallest];
            $smallest = $right if $right <= $#$data && $data->[$right] < $data->[$smallest];
            last if $smallest == $i;
            @{$data}[$i, $smallest] = @{$data}[$smallest, $i];
            $i = $smallest;
        }
    }
    return $min;
}

package main;

my $pq = MinHeap->new();
$pq->insert($_) for (5, 3, 8, 1, 9, 2);

my @sorted;
while (defined(my $val = $pq->extract_min())) {
    push @sorted, $val;
}
print join(" ", @sorted), "\n";
