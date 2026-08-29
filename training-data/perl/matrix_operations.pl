use strict;
use warnings;

sub transpose {
    my $matrix = shift;
    my @result;
    for my $c (0 .. $#{$matrix->[0]}) {
        push @result, [map { $matrix->[$_][$c] } 0 .. $#$matrix];
    }
    return \@result;
}

sub multiply {
    my ($a, $b) = @_;
    my $bt = transpose($b);
    my @result;
    for my $row (@$a) {
        my @new_row;
        for my $col (@$bt) {
            my $sum = 0;
            $sum += $row->[$_] * $col->[$_] for 0 .. $#$row;
            push @new_row, $sum;
        }
        push @result, \@new_row;
    }
    return \@result;
}

my $a = [[1, 2], [3, 4]];
my $b = [[5, 6], [7, 8]];
my $product = multiply($a, $b);
print join(" ", @$_), "\n" for @$product;
