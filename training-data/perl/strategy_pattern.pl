use strict;
use warnings;

package StrategyAscending;

sub new { return bless {}, shift; }

sub sort_list {
    my ($self, @items) = @_;
    return sort { $a <=> $b } @items;
}

package StrategyDescending;

sub new { return bless {}, shift; }

sub sort_list {
    my ($self, @items) = @_;
    return sort { $b <=> $a } @items;
}

package Sorter;

sub new {
    my ($class, $strategy) = @_;
    return bless { strategy => $strategy }, $class;
}

sub set_strategy {
    my ($self, $strategy) = @_;
    $self->{strategy} = $strategy;
}

sub sort_list {
    my ($self, @items) = @_;
    return $self->{strategy}->sort_list(@items);
}

package main;

my @numbers = (5, 2, 8, 1, 9);

my $sorter = Sorter->new(StrategyAscending->new);
print join(",", $sorter->sort_list(@numbers)), "\n";

$sorter->set_strategy(StrategyDescending->new);
print join(",", $sorter->sort_list(@numbers)), "\n";
