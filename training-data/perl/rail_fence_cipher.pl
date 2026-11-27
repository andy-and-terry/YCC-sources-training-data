use strict;
use warnings;

sub encode {
    my ($text, $rails) = @_;
    my @rows = ('') x $rails;
    my ($r, $step) = (0, 1);
    for my $ch (split //, $text) {
        $rows[$r] .= $ch;
        $step = 1 if $r == 0;
        $step = -1 if $r == $rails - 1;
        $r += $step;
    }
    return join '', @rows;
}

print encode("WEAREDISCOVERED", 3), "\n";
