use strict;
use warnings;

sub next_greater_element {
    my (@nums) = @_;
    my @result = (-1) x scalar(@nums);
    my @stack;
    for my $i (0 .. $#nums) {
        while (@stack && $nums[$stack[-1]] < $nums[$i]) {
            my $idx = pop @stack;
            $result[$idx] = $nums[$i];
        }
        push @stack, $i;
    }
    return @result;
}

my @nums = (2, 1, 2, 4, 3, 1);
print join(" ", next_greater_element(@nums)), "\n";
