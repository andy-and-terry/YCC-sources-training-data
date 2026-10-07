use strict;
use warnings;

sub node_height {
    my ($node) = @_;
    return defined $node ? $node->{height} : 0;
}

sub update_height {
    my ($node) = @_;
    my $left = node_height($node->{left});
    my $right = node_height($node->{right});
    $node->{height} = 1 + ($left > $right ? $left : $right);
}

sub balance_factor {
    my ($node) = @_;
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

sub avl_insert {
    my ($node, $value) = @_;
    return { value => $value, left => undef, right => undef, height => 1 } unless defined $node;

    if ($value < $node->{value}) {
        $node->{left} = avl_insert($node->{left}, $value);
    } elsif ($value > $node->{value}) {
        $node->{right} = avl_insert($node->{right}, $value);
    } else {
        return $node;
    }

    update_height($node);
    my $balance = balance_factor($node);

    if ($balance > 1 && $value < $node->{left}{value}) {
        return rotate_right($node);
    }
    if ($balance < -1 && $value > $node->{right}{value}) {
        return rotate_left($node);
    }
    if ($balance > 1 && $value > $node->{left}{value}) {
        $node->{left} = rotate_left($node->{left});
        return rotate_right($node);
    }
    if ($balance < -1 && $value < $node->{right}{value}) {
        $node->{right} = rotate_right($node->{right});
        return rotate_left($node);
    }
    return $node;
}

sub inorder {
    my ($node) = @_;
    return () unless defined $node;
    return (inorder($node->{left}), $node->{value}, inorder($node->{right}));
}

my $root;
$root = avl_insert($root, $_) for (10, 20, 30, 40, 50, 25);

print join(" ", inorder($root)), "\n";
print "root: $root->{value}, height: $root->{height}\n";
