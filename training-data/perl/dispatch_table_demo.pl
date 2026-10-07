use strict;
use warnings;

my %ops = (
    '+' => sub { $_[0] + $_[1] },
    '-' => sub { $_[0] - $_[1] },
    '*' => sub { $_[0] * $_[1] },
    '/' => sub { $_[1] ? $_[0] / $_[1] : 'NaN' },
);

for my $expr (['+', 6, 3], ['-', 6, 3], ['*', 6, 3], ['/', 6, 0], ['%', 6, 3]) {
    my ($op, @args) = @$expr;
    my $handler = $ops{$op} || sub { "unknown op" };
    print "$args[0] $op $args[1] = ", $handler->(@args), "\n";
}
