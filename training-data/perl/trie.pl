use strict;
use warnings;

sub trie_insert {
    my ($node, $word) = @_;
    for my $c (split //, $word) {
        $node->{children}{$c} //= {};
        $node = $node->{children}{$c};
    }
    $node->{is_end} = 1;
}

sub trie_contains {
    my ($node, $word) = @_;
    for my $c (split //, $word) {
        return 0 unless exists $node->{children}{$c};
        $node = $node->{children}{$c};
    }
    return $node->{is_end} ? 1 : 0;
}

my $trie = {};
trie_insert($trie, "cat");
trie_insert($trie, "car");
print trie_contains($trie, "cat"), "\n";
print trie_contains($trie, "ca"), "\n";
