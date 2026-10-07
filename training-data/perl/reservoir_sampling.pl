use strict;
use warnings;

srand(7);

sub reservoir_sample {
    my ($stream, $k) = @_;
    my @reservoir = @{$stream}[0 .. $k - 1];
    for my $i ($k .. $#$stream) {
        my $j = int(rand($i + 1));
        $reservoir[$j] = $stream->[$i] if $j < $k;
    }
    return @reservoir;
}

my @stream = (1 .. 10);
print join(",", reservoir_sample(\@stream, 3)), "\n";
