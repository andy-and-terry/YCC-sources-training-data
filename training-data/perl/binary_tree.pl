use strict;
use warnings;

sub insert_node {
    my ($node, $value) = @_;
    return { value => $value, left => undef, right => undef } unless $node;
    if ($value < $node->{value}) {
        $node->{left} = insert_node($node->{left}, $value);
    } elsif ($value > $node->{value}) {
        $node->{right} = insert_node($node->{right}, $value);
    }
    return $node;
}

sub inorder {
    my ($node, $result) = @_;
    return unless $node;
    inorder($node->{left}, $result);
    push @$result, $node->{value};
    inorder($node->{right}, $result);
}

my $root;
$root = insert_node($root, $_) for (5, 3, 8, 1, 4, 7, 9);
my @result;
inorder($root, \@result);
print "@result\n";
