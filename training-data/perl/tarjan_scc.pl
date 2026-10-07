use strict;
use warnings;

my %adj = (
    0 => [1],
    1 => [2],
    2 => [0],
    3 => [1, 2, 4],
    4 => [3, 5],
    5 => [2, 6],
    6 => [5],
);

my (%index, %lowlink, %on_stack);
my @stack;
my $counter = 0;
my @sccs;

sub strong_connect {
    my ($v) = @_;
    $index{$v} = $counter;
    $lowlink{$v} = $counter;
    $counter++;
    push @stack, $v;
    $on_stack{$v} = 1;

    for my $w (@{ $adj{$v} }) {
        if (!exists $index{$w}) {
            strong_connect($w);
            $lowlink{$v} = $lowlink{$w} if $lowlink{$w} < $lowlink{$v};
        } elsif ($on_stack{$w}) {
            $lowlink{$v} = $index{$w} if $index{$w} < $lowlink{$v};
        }
    }

    if ($lowlink{$v} == $index{$v}) {
        my @component;
        while (1) {
            my $w = pop @stack;
            $on_stack{$w} = 0;
            push @component, $w;
            last if $w == $v;
        }
        push @sccs, \@component;
    }
}

for my $v (sort keys %adj) {
    strong_connect($v) unless exists $index{$v};
}

for my $comp (@sccs) {
    print join(" ", @$comp), "\n";
}
