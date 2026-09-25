use strict;
use warnings;
use List::Util qw(sum);

sub next_n { sum map { $_ * $_ } split //, shift }

sub is_happy {
    my ($slow, $fast) = (shift) x 2;
    do { $slow = next_n($slow); $fast = next_n(next_n($fast)) } while $slow != $fast;
    return $slow == 1;
}

print 'happy <= 50: ', join(' ', grep { is_happy($_) } 1 .. 50), "\n";
my ($n, @chain) = (19);
push(@chain, $n), $n = next_n($n) until $n == 1;
print 'chain for 19: ', join(' -> ', @chain, 1), "\n";
