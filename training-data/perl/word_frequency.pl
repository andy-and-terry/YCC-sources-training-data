use strict;
use warnings;

sub word_frequency {
    my $text = lc shift;
    my %freq;
    $freq{$_}++ for split /\s+/, $text;
    return \%freq;
}

my $freq = word_frequency("the quick brown fox the lazy fox");
for my $word (sort keys %$freq) {
    print "$word: $freq->{$word}\n";
}
