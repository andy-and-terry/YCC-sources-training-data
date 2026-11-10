use strict; use warnings;
sub tau { my $n = shift; scalar grep { $n % $_ == 0 } 1 .. $n }
print join(" ", grep { $_ % tau($_) == 0 } 1 .. 59), "\n"; # 1 2 8 9 12 18 24 36 40 56
