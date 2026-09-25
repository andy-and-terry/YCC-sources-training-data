use strict;
use warnings;

sub rot13 { (my $s = shift) =~ tr/A-Za-z/N-ZA-Mn-za-m/; $s }

sub caesar {
    my ($s, $k) = @_;
    $k %= 26;
    $s =~ s/([a-z])/chr((ord($1) - 97 + $k) % 26 + 97)/ge;
    $s =~ s/([A-Z])/chr((ord($1) - 65 + $k) % 26 + 65)/ge;
    return $s;
}

my $msg = 'Why did the chicken cross the road?';
my $enc = rot13($msg);
print "$enc\n";
printf "roundtrip=%d caesar13=%d caesar(-3)=%s\n", rot13($enc) eq $msg, caesar($msg, 13) eq $enc, caesar('abc XYZ', -3);
