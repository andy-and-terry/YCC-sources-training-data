use strict;
use warnings;

# A self-balancing binary search tree (AVL tree): after every insert, the
# tree is rebalanced with single/double rotations so the height difference
# between left and right subtrees never exceeds 1.

sub node_height {
    my ($node) = @_;
    return 0 unless defined $node;
    return $node->{height};
}

sub update_height {
    my ($node) = @_;
    my $lh = node_height($node->{left});
    my $rh = node_height($node->{right});
    $node->{height} = 1 + ($lh > $rh ? $lh : $rh);
}

sub balance_factor {
    my ($node) = @_;
    return 0 unless defined $node;
    return node_height($node->{left}) - node_height($node->{right});
}

sub rotate_right {
    my ($y) = @_;
    my $x = $y->{left};
    my $t2 = $x->{right};
    $x->{right} = $y;
    $y->{left} = $t2;
    update_height($y);
    update_height($x);
    return $x;
}

sub rotate_left {
    my ($x) = @_;
    my $y = $x->{right};
    my $t2 = $y->{left};
    $y->{left} = $x;
    $x->{right} = $t2;
    update_height($x);
    update_height($y);
    return $y;
}

sub insert {
    my ($node, $value) = @_;
    return { value => $value, left => undef, right => undef, height => 1 }
        unless defined $node;

    if ($value < $node->{value}) {
        $node->{left} = insert($node->{left}, $value);
    } elsif ($value > $node->{value}) {
        $node->{right} = insert($node->{right}, $value);
    } else {
        return $node;
    }

    update_height($node);
    my $balance = balance_factor($node);

    # Left-left
    if ($balance > 1 && $value < $node->{left}{value}) {
        return rotate_right($node);
    }
    # Right-right
    if ($balance < -1 && $value > $node->{right}{value}) {
        return rotate_left($node);
    }
    # Left-right
    if ($balance > 1 && $value > $node->{left}{value}) {
        $node->{left} = rotate_left($node->{left});
        return rotate_right($node);
    }
    # Right-left
    if ($balance < -1 && $value < $node->{right}{value}) {
        $node->{right} = rotate_right($node->{right});
        return rotate_left($node);
    }

    return $node;
}

sub inorder {
    my ($node, $acc) = @_;
    return unless defined $node;
    inorder($node->{left}, $acc);
    push @$acc, $node->{value};
    inorder($node->{right}, $acc);
}

my $root;
for my $value (10, 20, 30, 40, 50, 25) {
    $root = insert($root, $value);
}

my @sorted;
inorder($root, \@sorted);
print join(",", @sorted), "\n";
print "root: $root->{value}, height: $root->{height}\n";
