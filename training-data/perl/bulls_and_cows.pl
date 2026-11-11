use strict;
use warnings;

# Bulls and Cows scoring for equal-length digit strings.
sub score {
    my ($secret, $guess) = @_;
    my ($bulls, %sc, %gc) = (0);
    for my $i (0 .. length($secret) - 1) {
        my ($s, $g) = (substr($secret, $i, 1), substr($guess, $i, 1));
        if ($s eq $g) { $bulls++ } else { $sc{$s}++; $gc{$g}++ }
    }
    my $cows = 0;
    for my $c (keys %sc) {
        my $g = $gc{$c} // 0;
        $cows += $sc{$c} < $g ? $sc{$c} : $g;
    }
    return ($bulls, $cows);
}

my ($b, $c) = score("1807", "7810");
print "$b bull(s), $c cow(s)\n";
