use strict;
use warnings;

package MinHeap;

sub new {
    my ($class) = @_;
    return bless { data => [] }, $class;
}

sub push_value {
    my ($self, $value) = @_;
    my $data = $self->{data};
    push @$data, $value;
    my $i = $#$data;
    while ($i > 0) {
        my $parent = int(($i - 1) / 2);
        last if $data->[$parent] <= $data->[$i];
        @$data[$parent, $i] = @$data[$i, $parent];
        $i = $parent;
    }
}

sub pop_value {
    my ($self) = @_;
    my $data = $self->{data};
    return undef unless @$data;
    my $top = $data->[0];
    my $last = pop @$data;
    if (@$data) {
        $data->[0] = $last;
        my $i = 0;
        my $n = scalar @$data;
        while (1) {
            my $left = 2 * $i + 1;
            my $right = 2 * $i + 2;
            my $smallest = $i;
            $smallest = $left if $left < $n && $data->[$left] < $data->[$smallest];
            $smallest = $right if $right < $n && $data->[$right] < $data->[$smallest];
            last if $smallest == $i;
            @$data[$smallest, $i] = @$data[$i, $smallest];
            $i = $smallest;
        }
    }
    return $top;
}

package main;

my $heap = MinHeap->new();
$heap->push_value($_) for (5, 3, 8, 1, 9, 2);

my @sorted;
while (defined(my $v = $heap->pop_value())) {
    push @sorted, $v;
}
print join(",", @sorted), "\n";
