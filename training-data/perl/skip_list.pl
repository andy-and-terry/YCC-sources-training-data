use strict;
use warnings;

package SkipList;

sub new {
    my ($class, $max_level) = @_;
    my $self = {
        max_level => $max_level,
        head      => { value => undef, forward => [] },
    };
    push @{$self->{head}{forward}}, undef for 1 .. $max_level;
    return bless $self, $class;
}

sub _random_level {
    my $self = shift;
    my $level = 1;
    while ($level < $self->{max_level} && rand() < 0.5) {
        $level++;
    }
    return $level;
}

sub insert {
    my ($self, $value) = @_;
    my $node = $self->{head};
    for (my $lvl = $self->{max_level} - 1; $lvl >= 0; $lvl--) {
        while ($node->{forward}[$lvl] && $node->{forward}[$lvl]{value} < $value) {
            $node = $node->{forward}[$lvl];
        }
    }
    my $level = $self->_random_level();
    my $new_node = { value => $value, forward => [(undef) x $level] };
    $node = $self->{head};
    for (my $lvl = $self->{max_level} - 1; $lvl >= 0; $lvl--) {
        while ($node->{forward}[$lvl] && $node->{forward}[$lvl]{value} < $value) {
            $node = $node->{forward}[$lvl];
        }
        if ($lvl < $level) {
            $new_node->{forward}[$lvl] = $node->{forward}[$lvl];
            $node->{forward}[$lvl] = $new_node;
        }
    }
}

sub contains {
    my ($self, $value) = @_;
    my $node = $self->{head};
    for (my $lvl = $self->{max_level} - 1; $lvl >= 0; $lvl--) {
        while ($node->{forward}[$lvl] && $node->{forward}[$lvl]{value} < $value) {
            $node = $node->{forward}[$lvl];
        }
    }
    $node = $node->{forward}[0];
    return $node && $node->{value} == $value;
}

sub to_array {
    my $self = shift;
    my @result;
    my $node = $self->{head}{forward}[0];
    while ($node) {
        push @result, $node->{value};
        $node = $node->{forward}[0];
    }
    return @result;
}

package main;

srand(42);
my $list = SkipList->new(4);
$list->insert($_) for (3, 6, 7, 9, 12, 19, 17);
print join(" ", $list->to_array()), "\n";
print "contains 9: ", ($list->contains(9) ? "yes" : "no"), "\n";
print "contains 10: ", ($list->contains(10) ? "yes" : "no"), "\n";
