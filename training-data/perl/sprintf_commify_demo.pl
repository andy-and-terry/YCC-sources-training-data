use strict; use warnings;

sub commify {
    my $n = reverse shift;
    $n =~ s/(\d{3})(?=\d)/$1,/g;
    return scalar reverse $n;
}
print commify($_), "\n" for (1234, 1234567, 999, 1000000000);
