use strict;
use warnings;

sub is_valid_isbn10 {
    (my $s = shift) =~ tr/-//d;
    return 0 unless $s =~ /^\d{9}[\dX]$/;
    my @c = split //, $s;
    my $total = 0;
    $total += ($c[$_] eq 'X' ? 10 : $c[$_]) * (10 - $_) for 0 .. 9;
    return $total % 11 == 0 ? 1 : 0;
}

printf "%s %d\n", $_, is_valid_isbn10($_) for qw(3-598-21508-8 3-598-21507-X 3-598-21508-9);
