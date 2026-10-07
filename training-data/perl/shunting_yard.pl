use strict;
use warnings;

my %PREC = ('+' => [1, 'L'], '-' => [1, 'L'], '*' => [2, 'L'], '/' => [2, 'L'], '^' => [3, 'R']);

sub to_rpn {
    my @tokens = shift =~ m{(\d+(?:\.\d+)?|[-+*/^()])}g;
    my (@out, @ops);
    for my $t (@tokens) {
        if ($t =~ /^\d/) { push @out, $t }
        elsif ($t eq '(') { push @ops, $t }
        elsif ($t eq ')') {
            push @out, pop @ops while @ops && $ops[-1] ne '(';
            die "mismatched parentheses\n" unless @ops;
            pop @ops;
        } else {
            my ($p, $assoc) = @{ $PREC{$t} };
            while (@ops && $ops[-1] ne '(') {
                my $top = $PREC{ $ops[-1] }[0];
                last unless $top > $p || ($top == $p && $assoc eq 'L');
                push @out, pop @ops;
            }
            push @ops, $t;
        }
    }
    die "mismatched parentheses\n" if grep { $_ eq '(' } @ops;
    return @out, reverse @ops;
}

sub eval_rpn {
    my @st;
    for my $t (@_) {
        if ($t =~ /^\d/) { push @st, $t; next }
        my ($b, $a) = (pop @st, pop @st);
        push @st, $t eq '+' ? $a + $b : $t eq '-' ? $a - $b : $t eq '*' ? $a * $b : $t eq '/' ? $a / $b : $a**$b;
    }
    return $st[0];
}

for my $e ('3 + 4 * 2 / (1 - 5) ^ 2 ^ 3', '(1 + 2) * (3 + 4)', '2 ^ 3 ^ 2') {
    my @rpn = to_rpn($e);
    print "$e => @rpn = ", eval_rpn(@rpn), "\n";
}
