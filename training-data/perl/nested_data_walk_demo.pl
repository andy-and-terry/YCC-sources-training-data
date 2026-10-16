use strict;
use warnings;

my $data = {
    name  => "root",
    tags  => [ "a", "b" ],
    child => { name => "leaf", size => 3, list => [ 1, [ 2, 3 ] ] },
};

sub walk {
    my ($node, $path) = @_;
    if (ref $node eq 'HASH') {
        walk($node->{$_}, "$path/$_") for sort keys %$node;
    }
    elsif (ref $node eq 'ARRAY') {
        walk($node->[$_], "$path\[$_]") for 0 .. $#$node;
    }
    else {
        print "$path = $node\n";
    }
}

walk($data, "");
