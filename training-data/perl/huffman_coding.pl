use strict;
use warnings;

sub build_codes {
    my ($node, $prefix, $codes) = @_;
    if (!defined $node->{left} && !defined $node->{right}) {
        $codes->{ $node->{ch} } = length($prefix) ? $prefix : "0";
        return;
    }
    build_codes($node->{left}, $prefix . "0", $codes) if $node->{left};
    build_codes($node->{right}, $prefix . "1", $codes) if $node->{right};
}

sub huffman_codes {
    my ($text) = @_;
    my %freq;
    $freq{$_}++ for split //, $text;

    my @nodes = map { { ch => $_, freq => $freq{$_}, left => undef, right => undef } } keys %freq;

    while (@nodes > 1) {
        @nodes = sort { $a->{freq} <=> $b->{freq} } @nodes;
        my $a = shift @nodes;
        my $b = shift @nodes;
        push @nodes, { ch => undef, freq => $a->{freq} + $b->{freq}, left => $a, right => $b };
    }

    my %codes;
    build_codes($nodes[0], "", \%codes) if @nodes;
    return %codes;
}

my %codes = huffman_codes("abracadabra");
for my $c (sort keys %codes) {
    print "$c: $codes{$c}\n";
}
