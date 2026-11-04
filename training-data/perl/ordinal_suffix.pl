use strict; use warnings;

sub ordinal {
    my $n = shift;
    my %sfx = (1 => 'st', 2 => 'nd', 3 => 'rd');
    my $s = ($n % 100 >= 11 && $n % 100 <= 13) ? 'th' : ($sfx{$n % 10} // 'th');
    return "$n$s";
}

print join(" ", map { ordinal($_) } 1, 2, 3, 4, 11, 12, 13, 21, 101, 111), "\n";
