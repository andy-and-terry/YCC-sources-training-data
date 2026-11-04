use strict; use warnings;

sub zigzag {
    my ($s, $rows) = @_;
    return $s if $rows == 1 || $rows >= length $s;
    my @lines = ('') x $rows;
    my ($r, $step) = (0, 1);
    for my $c (split //, $s) {
        $lines[$r] .= $c;
        $step = 1  if $r == 0;
        $step = -1 if $r == $rows - 1;
        $r += $step;
    }
    return join '', @lines;
}

print zigzag("PAYPALISHIRING", 3), "\n";
