use strict;
use warnings;

sub is_self_describing {
    my ($s) = @_;
    my @digits = split //, $s;
    for my $i (0 .. $#digits) {
        my $count = () = $s =~ /$i/g;
        return 0 if $count != $digits[$i];
    }
    return 1;
}

printf "%s %s\n", $_, is_self_describing($_) ? "true" : "false" for qw(1210 2020 21200 1211);
