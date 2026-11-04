use strict; use warnings;
use List::Util qw(min);

sub make_min_stack {
    my @items;
    return {
        push => sub { my $x = shift; my $m = @items ? min($x, $items[-1][1]) : $x; push @items, [$x, $m] },
        pop  => sub { (pop @items)->[0] },
        min  => sub { $items[-1][1] },
    };
}

my $s = make_min_stack();
$s->{push}->($_) for 5, 3, 7, 2;
print $s->{min}->(), "\n";
$s->{pop}->();
print $s->{min}->(), "\n";
