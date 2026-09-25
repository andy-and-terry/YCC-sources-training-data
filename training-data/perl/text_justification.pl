use strict;
use warnings;

sub justify {
    my ($width, @words) = @_;
    my @lines;
    while (@words) {
        my @line = (shift @words);
        my $len = length $line[0];
        while (@words && $len + @line + length $words[0] <= $width) {
            $len += length $words[0];
            push @line, shift @words;
        }
        my $gaps = @line - 1;
        if (!@words || !$gaps) {
            push @lines, sprintf '%-*s', $width, "@line";
            next;
        }
        my $spaces = $width - $len;
        my $s = '';
        for my $k (0 .. $#line) {
            $s .= $line[$k];
            $s .= ' ' x (int($spaces / $gaps) + ($k < $spaces % $gaps ? 1 : 0)) if $k < $gaps;
        }
        push @lines, $s;
    }
    return @lines;
}

print "[$_]\n" for justify(20, split ' ', 'This is an example of text justification that packs words greedily line by line');
