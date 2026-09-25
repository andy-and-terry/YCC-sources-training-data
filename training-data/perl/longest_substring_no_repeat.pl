use strict;
use warnings;

sub longest_unique {
    my ($s) = @_;
    my %last;
    my ($start, $best_start, $best_len) = (0, 0, 0);
    my @c = split //, $s;
    for my $i (0 .. $#c) {
        $start = $last{ $c[$i] } + 1 if exists $last{ $c[$i] } && $last{ $c[$i] } >= $start;
        $last{ $c[$i] } = $i;
        ($best_start, $best_len) = ($start, $i - $start + 1) if $i - $start + 1 > $best_len;
    }
    return substr $s, $best_start, $best_len;
}

for (qw(abcabcbb bbbbb pwwkew dvdf)) {
    my $r = longest_unique($_);
    print "$_ $r ", length $r, "\n";
}
