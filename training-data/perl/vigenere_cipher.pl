use strict;
use warnings;

sub vigenere {
    my ($text, $key, $decrypt) = @_;
    my @k = map { ord($_) - 97 } split //, lc($key =~ s/[^A-Za-z]//gr);
    my $i = 0;
    $text =~ s{([A-Za-z])}{
        my $ch = $1;
        my $base = $ch =~ /[A-Z]/ ? 65 : 97;
        my $shift = $k[ $i++ % @k ];
        chr((ord($ch) - $base + ($decrypt ? 26 - $shift : $shift)) % 26 + $base)
    }ge;
    return $text;
}

my $enc = vigenere('Attack at dawn!', 'LEMON');
print "$enc -> ", vigenere($enc, 'LEMON', 1), "\n";
