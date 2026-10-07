use strict;
use warnings;

sub build {
    my ($vals, $loop_to) = @_;
    my @nodes = map { { val => $_, next => undef } } @$vals;
    $nodes[$_]{next} = $nodes[$_ + 1] for 0 .. $#nodes - 1;
    $nodes[-1]{next} = $nodes[$loop_to] if defined $loop_to;
    return ($nodes[0], \@nodes);
}

# Floyd's tortoise and hare: returns (cycle start node, cycle length) or ()
sub find_cycle {
    my ($head) = @_;
    my ($slow, $fast) = ($head, $head);
    while ($fast && $fast->{next}) {
        $slow = $slow->{next};
        $fast = $fast->{next}{next};
        if (defined $fast && $slow == $fast) {
            my $p = $head;
            ($p, $slow) = ($p->{next}, $slow->{next}) while $p != $slow;
            my ($len, $q) = (1, $p->{next});
            ($q, $len) = ($q->{next}, $len + 1) while $q != $p;
            return ($p, $len);
        }
    }
    return;
}

for my $case ([[1 .. 6], 2], [[1 .. 4], undef]) {
    my ($head, $nodes) = build(@$case);
    my ($start, $len) = find_cycle($head);
    print $start ? "cycle starts at $start->{val}, length $len\n" : "no cycle\n";
    $_->{next} = undef for @$nodes;    # break reference cycle
}
