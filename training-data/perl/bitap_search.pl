use strict; use warnings;
sub bitap {
    my ($text, $pat) = @_;
    my %masks;
    my @p = split //, $pat;
    $masks{$p[$_]} |= 1 << $_ for 0 .. $#p;
    my ($state, $goal) = (0, 1 << $#p);
    my @t = split //, $text;
    for my $i (0 .. $#t) {
        $state = (($state << 1) | 1) & ($masks{$t[$i]} // 0);
        return $i - @p + 1 if $state & $goal;
    }
    return -1;
}
print bitap("the quick brown fox", "brown"), "\n";
