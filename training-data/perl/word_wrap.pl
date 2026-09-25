use strict;
use warnings;

sub wrap_text {
    my ($text, $width) = @_;
    my (@lines, $line);
    for my $word (split ' ', $text) {
        while (length $word > $width) {    # hard-break very long words
            push @lines, $line if defined $line;
            undef $line;
            push @lines, substr $word, 0, $width, '';
        }
        if    (!defined $line)                                   { $line = $word }
        elsif (length($line) + 1 + length($word) <= $width)      { $line .= " $word" }
        else                                                     { push @lines, $line; $line = $word }
    }
    push @lines, $line if defined $line && length $line;
    return @lines;
}

my $text = 'The quick brown fox jumps over the lazy dog and keeps running supercalifragilisticexpialidocious';
printf "|%-16s|\n", $_ for wrap_text($text, 16);

# the regex one-liner version (no hard breaks)
(my $re = $text) =~ s/(.{1,16})(?:\s+|$)/$1\n/g;
print $re;
