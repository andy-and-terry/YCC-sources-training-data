use strict;
use warnings;

sub luhn_valid {
    (my $s = shift) =~ s/\s//g;
    return 0 if length($s) < 2 || $s =~ /\D/;
    my ($sum, $i) = (0, 0);
    for my $d (reverse split //, $s) {
        if ($i++ % 2) {
            $d *= 2;
            $d -= 9 if $d > 9;
        }
        $sum += $d;
    }
    return $sum % 10 == 0 ? 1 : 0;
}

print luhn_valid("4539 3195 0343 6467"), " ", luhn_valid("8273 1232 7352 0569"), "\n";
